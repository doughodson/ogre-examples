--
-- If premake command is not supplied an action (target compiler), exit!
--
-- Target of interest:
--     vs2013     (Visual Studio 2013)
--     vs2015     (Visual Studio 2015)
--

-- we must have an ide/compiler specified
if (_ACTION == nil) then
  return
end


--
-- directory locations for framework and 3rd party dependencies
--
OGRE_ROOT  = "../../../ogre-sdk-1.9.0"
--OGRE_ROOT  = "../../../ogre-sdk-2.1.0"
BOOST_ROOT = "../../../boost-1.61"

locationPath  = "../" .. _ACTION

--
-- set include and library paths
--
if (_ACTION == "vs2013") or (_ACTION == "vs2015") then
   OGREIncPath         = OGRE_ROOT .. "/include"
   OGRELibDebugPath    = OGRE_ROOT .. "/lib/Debug"
   OGRELibReleasePath  = OGRE_ROOT .. "/lib/Release"
   BOOSTLibPath        = BOOST_ROOT .. "/lib"
end
print ("OGRE Paths:")
print ("  Include           : " .. OGREIncPath)
print ("  Libraries Debug   : " .. OGRELibDebugPath)
print ("  Libraries Release : " .. OGRELibReleasePath)

workspace "examples"

   -- destination directory for generated solution/project files
   location (locationPath)

   -- C++ code in all projects
   language "C++"

   --
   -- Build (solution) configuration options:
   --     Release32        (Application linked to Multi-threaded DLL)
   --     Debug32          (Application linked to Multi-threaded Debug DLL)
   --
   configurations { "Release32", "Debug32" }

   -- common release configuration flags and symbols
   filter { "Release32" }
      flags { "Optimize" }
      if (_ACTION == "vs2013") or (_ACTION == "vs2015") then
         -- enable compiler intrinsics and favour speed over size
         buildoptions { "/Oi", "/Ot" }
         defines { "WIN32", "NDEBUG" }
      end

   -- common debug configuration flags and symbols
   filter { "Debug32" }
      targetsuffix "_d"
      flags { "Symbols" }
      if (_ACTION == "vs2013") or (_ACTION == "vs2015") then
         -- enable compiler intrinsics
         buildoptions { "/Oi" }
         defines { "WIN32", "_DEBUG" }
      end

   -- example apps
   dofile "app-dev.lua"
   dofile "beginners.lua"
