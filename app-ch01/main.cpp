
#include "OGRE\ExampleApplication.h"

class Example1 : public ExampleApplication
{
public:
   void createScene();
};

void Example1::createScene()
{
   // Create a Light and set its position
   Ogre::Light* light = mSceneMgr->createLight("MainLight");
   light->setPosition(20.0f, 80.0f, 50.0f);
   Ogre::Entity* ent = mSceneMgr->createEntity("MyEntity", "Sinbad.mesh");
   mSceneMgr->getRootSceneNode()->attachObject(ent);
}

int main()
{
   Example1 app;
   app.go();
   return 0;
}
