--------------------------------------------------------
-- Beginner's Guide examples
--------------------------------------------------------

-- beg-ch01
project "beg-ch01"
   kind "ConsoleApp"
   targetname "beg-ch01"
   targetdir "../../bin"
   debugdir "../../bin"
   files {
      "../../beg-ch01/**.cpp",
      "../../beg-ch01/**.h"
   }
   defines { "_CONSOLE" }
   includedirs { OGREIncPath,
                 OGREIncPath .. "/OGRE/Overlay",
                 OGREIncPath .. "/OGRE/Paging",
                 BOOST_ROOT }
   libdirs { BOOSTLibPath }
   filter "Release32"
      libdirs { OGRELibReleasePath }
      links {"OgreMain", "OgreOverlay", "OIS"}
      links {"Ws2_32", "Winmm", "comctl32", "gdi32"}
   filter "Debug32"
      libdirs { OGRELibDebugPath }
      links {"OgreMain_d", "OgreOverlay_d", "OIS_d"}
      links {"Ws2_32", "Winmm", "comctl32", "gdi32"}
