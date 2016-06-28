--------------------------------------------------------
-- App developers examples
--------------------------------------------------------

-- app-ch01
project "app-ch01"
   kind "WindowedApp"
   targetname "app-ch01"
   targetdir "../../bin"
   debugdir "../../bin"
   files {
      "../../app-ch01/**.cpp",
      "../../app-ch01/**.h"
   }
   defines { "_AFXDLL" }
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
