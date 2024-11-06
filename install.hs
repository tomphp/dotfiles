#!/usr/bin/env stack
{- stack --resolver lts-19.17 script
    --package executable-path
    --package turtle
    --package text
-}

{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

import Prelude hiding (FilePath)
import Turtle
import Data.Text (isPrefixOf, pack)
import Debug.Trace
import System.Environment.Executable (ScriptPath(..), getScriptPath)

data OS = OSX deriving Show

main :: IO ()
main = do
  echo "Installing software"
  brewBundle
  echo "Creating project directories"
  personalProjects <- homePath "Projects/tomoram"
  mktree personalProjects
  akProjects <- homePath "Projects/ak"
  mktree akProjects
  echo "Setting up gpg"
  setupGpg
  echo "Setting up git"
  setupGit
  -- echo "Setting up ZSH"
  -- setupZsh
  -- echo "Setting up VIM"
  -- setupVim
  -- echo "Setting up VSCode"
  -- view installVSCodeExtensions

brewBundle :: IO ()
brewBundle = do
  result <- cmd "brew bundle"
  case result of
    ExitSuccess   -> echo "All software installed"
    ExitFailure _ -> echo "Install failed"

-- gpg

setupGpg :: IO ()
setupGpg = do
  gpgDir <- homePath ".gnupg/"
  mktree gpgDir
  
  linkDotfile "gpg/gpg.conf" ".gnupg/gpg.conf"
  linkDotfile "gpg/gpg-agent.conf" ".gnupg/gpg-agent.conf"

-- git

setupGit :: IO ()
setupGit = do
  linkDotfile "git/gitconfig" ".gitconfig"
  linkDotfile "git/gitignore_global" ".gitignore_global"
  target <- repoPath "git/ak_gitconfig"
  link <- homePath "Projects/ak/.gitconfig"
  forceSymlink target link

-- zsh

setupZsh :: IO ()
setupZsh = do
  echo "Setting up ZSH"
  chshToZsh
  installOhMyZsh
  linkDotfile "zsh/zshrc" ".zshrc"
  installZshDraculaTheme

chshToZsh :: IO ()
chshToZsh = do
  echo "Setting ZSH as the users shell"
  res <- cmd "chsh -s /bin/zsh"
  case res of
    ExitSuccess   -> echo "Success"
    ExitFailure _ -> echo "Failed"

installOhMyZsh :: IO ()
installOhMyZsh = do
  let installCommand = "sh -c \"$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)\"" 
  result <- cmd installCommand
  case result of
    ExitSuccess   -> echo "Yay"
    ExitFailure 1 -> echo "Already installed"
    ExitFailure _ -> echo "Error"

installZshDraculaTheme :: IO ()
installZshDraculaTheme = do
  h <- home 

  let themePath = h </> ".dracula-theme"
  let gitUrl = "https://github.com/dracula/zsh.git"

  echo "Installing ZSH Dracula Theme"
  gitClone gitUrl themePath

  let target = themePath </> "dracula.zsh-theme"
  let link = h </> ".oh-my-zsh/themes/dracula.zsh-theme"

  forceSymlink target link

-- vim

setupVim :: IO ()
setupVim = do
  linkDotfile "vim/vimrc" ".vimrc"
  installVimPlug
  installVimPlugins

installVimPlug :: IO ()
installVimPlug = do
  echo "Installing vim-plug"
  res <- cmd "curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  case res of
    ExitSuccess -> echo "Success"
    ExitFailure err -> print err

installVimPlugins :: IO ()
installVimPlugins = do
  echo "Installing VIM plugins"
  res <- cmd "vim +PlugInstall! +qall"
  case res of
    ExitSuccess -> echo "Success"
    ExitFailure err -> print err

-- VScode

installVSCodeExtensions :: Shell ()
installVSCodeExtensions = do
  ext <- select extensions
  void $ cmd $ format ("code --install-extension " %s) ext
  where extensions =
          [ "ms-vsliveshare.vsliveshare"
          , "streetsidesoftware.code-spell-checker"
          , "pivotal.vscode-concourse"
          , "mauve.terraform"
          -- haskell
          , "justusadam.language-haskell"
          , "hoovercj.haskell-linter"
          -- elm
          , "sbrink.elm"
          ]

-- Lib

linkDotfile :: FilePath -> FilePath -> IO ()
linkDotfile target link = do
  target' <- repoPath target
  link' <- homePath link
  forceSymlink target' link'

cmd :: MonadIO io => Text -> io ExitCode
cmd c = shell c empty

chsh :: FilePath -> IO ()
chsh path = do
  echo "Setting ZSH as the users shell"
  res <- cmd $ format ("chsh -s %s" % fp) path
  case res of
    ExitSuccess   -> echo "Success"
    ExitFailure _ -> echo "Failed"

forceSymlink :: FilePath -> FilePath -> IO ()
forceSymlink target link = do
  print $ format ("Creating symlink " % fp % " -> " % fp) target link
  exists <- testfile link
  when exists $ do
    print $ format ("Removeing symlink " % fp) link
    rm link 
  symlink target link

gitClone :: Text -> FilePath -> IO ()
gitClone url dest = do
  print $ format ("Cloning " % s % " into " % fp) url dest
  exists <- testpath dest
  if exists
     then echo "Skipping: Destination exists"
     else do
        res <- cmd $ format ("git clone " % s % " " % fp) url dest
        case res of
          ExitSuccess -> echo "Success"
          ExitFailure err -> print err

repoPath :: FilePath -> IO FilePath
repoPath path = (</> path) <$> scriptDir

homePath :: FilePath -> IO FilePath
homePath path = (</> path) <$> home

scriptDir :: IO FilePath
scriptDir = do
  scriptPath <- getScriptPath
  case scriptPath of
    Executable p -> return $ directory (fromString p)
    RunGHC p     -> return $ directory (fromString p)
    Interactive  -> error "This should not be run in GHCI"
