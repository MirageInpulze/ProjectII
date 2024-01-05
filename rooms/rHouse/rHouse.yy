{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "rHouse",
  "creationCodeFile": "",
  "inheritCode": true,
  "inheritCreationOrder": true,
  "inheritLayers": true,
  "instanceCreationOrder": [
    {"name":"inst_3038E2A_1","path":"rooms/rHouse/rHouse.yy",},
    {"name":"inst_3BAD4DF8","path":"rooms/rHouse/rHouse.yy",},
    {"name":"inst_3423CAA9","path":"rooms/rHouse/rHouse.yy",},
    {"name":"inst_26DB6BFC","path":"rooms/rHouse/rHouse.yy",},
    {"name":"inst_A04D96D","path":"rooms/rHouse/rHouse.yy",},
    {"name":"inst_15F291B2","path":"rooms/rHouse/rHouse.yy",},
  ],
  "isDnd": false,
  "layers": [
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Instances","depth":0,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_3038E2A_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":true,"inheritedItemId":{"name":"inst_3038E2A_1","path":"rooms/rParent/rParent.yy",},"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oPlayer","path":"objects/oPlayer/oPlayer.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":184.0,"y":126.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_3BAD4DF8","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oRoomExit","path":"objects/oRoomExit/oRoomExit.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"oRoomExit","path":"objects/oRoomExit/oRoomExit.yy",},"propertyId":{"name":"targetRoom","path":"objects/oRoomExit/oRoomExit.yy",},"value":"rVillage",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"oRoomExit","path":"objects/oRoomExit/oRoomExit.yy",},"propertyId":{"name":"targetY","path":"objects/oRoomExit/oRoomExit.yy",},"value":"144",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"oRoomExit","path":"objects/oRoomExit/oRoomExit.yy",},"propertyId":{"name":"targetX","path":"objects/oRoomExit/oRoomExit.yy",},"value":"216",},
          ],"rotation":0.0,"scaleX":0.5,"scaleY":0.5,"x":176.0,"y":128.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_3423CAA9","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oShopkeep","path":"objects/oShopkeep/oShopkeep.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"pEntity","path":"objects/pEntity/pEntity.yy",},"propertyId":{"name":"entityActivateScript","path":"objects/pEntity/pEntity.yy",},"value":"NewTextBox",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"pEntity","path":"objects/pEntity/pEntity.yy",},"propertyId":{"name":"entityActivateArgs","path":"objects/pEntity/pEntity.yy",},"value":"[\"Welcome to my shop! Anything of interest?\", 2]",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":128.0,"y":96.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_26DB6BFC","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":1,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oShopItem","path":"objects/oShopItem/oShopItem.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"oShopItem","path":"objects/oShopItem/oShopItem.yy",},"propertyId":{"name":"itemCost","path":"objects/oShopItem/oShopItem.yy",},"value":"10",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"oShopItem","path":"objects/oShopItem/oShopItem.yy",},"propertyId":{"name":"itemAmount","path":"objects/oShopItem/oShopItem.yy",},"value":"5",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"pEntity","path":"objects/pEntity/pEntity.yy",},"propertyId":{"name":"entityActivateArgs","path":"objects/pEntity/pEntity.yy",},"value":"[\"Bombs! Only 10 Coins to start blowing up the world to your desires!\", 1, [\"6:Purchase\", \"0:No Thanks\"]]",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":176.0,"y":64.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_A04D96D","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":2,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oShopItem","path":"objects/oShopItem/oShopItem.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"oShopItem","path":"objects/oShopItem/oShopItem.yy",},"propertyId":{"name":"item","path":"objects/oShopItem/oShopItem.yy",},"value":"item.bow",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"oShopItem","path":"objects/oShopItem/oShopItem.yy",},"propertyId":{"name":"itemCost","path":"objects/oShopItem/oShopItem.yy",},"value":"15",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"oShopItem","path":"objects/oShopItem/oShopItem.yy",},"propertyId":{"name":"itemAmount","path":"objects/oShopItem/oShopItem.yy",},"value":"15",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"pEntity","path":"objects/pEntity/pEntity.yy",},"propertyId":{"name":"entityActivateArgs","path":"objects/pEntity/pEntity.yy",},"value":"[\"Bow And Arrows! Special offer!\\n15 Arrorw for 15 Coins!\", 1, [\"6:Purchase\", \"0:No Thanks\"]]",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":208.0,"y":64.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_15F291B2","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":3,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oShopItem","path":"objects/oShopItem/oShopItem.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"oShopItem","path":"objects/oShopItem/oShopItem.yy",},"propertyId":{"name":"item","path":"objects/oShopItem/oShopItem.yy",},"value":"item.hook",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"oShopItem","path":"objects/oShopItem/oShopItem.yy",},"propertyId":{"name":"itemCost","path":"objects/oShopItem/oShopItem.yy",},"value":"25",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"pEntity","path":"objects/pEntity/pEntity.yy",},"propertyId":{"name":"entityActivateArgs","path":"objects/pEntity/pEntity.yy",},"value":"[\"Hook Shot! 25 Coins!\\n For your travesing needs as well as pulling things over from a distance!\", 1, [\"6:Purchase\", \"0:No Thanks\"]]",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":144.0,"y":64.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"lCollision","depth":100,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":23,"SerialiseWidth":40,"TileCompressedData":[
-86,0,-10,1,-30,0,1,1,-8,0,1,1,-30,0,-10,1,-30,0,1,1,-8,0,1,1,-30,0,1,1,-8,0,1,1,-30,0,1,1,-8,0,1,1,
-30,0,-5,1,1,0,-4,1,-34,0,-3,1,-547,0,],"TileDataFormat":1,},"tilesetId":{"name":"tCollision","path":"tilesets/tCollision/tCollision.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles_2","depth":200,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":23,"SerialiseWidth":40,"TileCompressedData":[
-86,0,10,173,174,174,175,174,175,174,175,175,178,-30,0,1,188,-8,189,1,193,-30,0,2,188,128,-6,129,2,130,193,-30,0,1,188,-8,189,1,193,-30,
0,1,188,-8,189,1,193,-30,0,1,188,-8,189,1,193,-30,0,1,203,-3,204,6,205,189,207,204,204,208,-584,0,],"TileDataFormat":1,},"tilesetId":{"name":"tTiles2","path":"tilesets/tTiles2/tTiles2.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles_1","depth":300,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":23,"SerialiseWidth":40,"TileCompressedData":[
-920,0,],"TileDataFormat":1,},"tilesetId":{"name":"tTiles","path":"tilesets/tTiles/tTiles.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"Background","animationFPS":15.0,"animationSpeedType":0,"colour":4278190080,"depth":400,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"hspeed":0.0,"htiled":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"spriteId":null,"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
  ],
  "parent": {
    "name": "Rooms",
    "path": "folders/Rooms.yy",
  },
  "parentRoom": {
    "name": "rParent",
    "path": "rooms/rParent/rParent.yy",
  },
  "physicsSettings": {
    "inheritPhysicsSettings": true,
    "PhysicsWorld": false,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 10.0,
    "PhysicsWorldPixToMetres": 0.1,
  },
  "roomSettings": {
    "Height": 360,
    "inheritRoomSettings": true,
    "persistent": false,
    "Width": 640,
  },
  "sequenceId": null,
  "views": [
    {"hborder":32,"hport":360,"hspeed":-1,"hview":180,"inherit":true,"objectId":null,"vborder":32,"visible":true,"vspeed":-1,"wport":640,"wview":320,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":360,"hspeed":-1,"hview":360,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":640,"wview":640,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":360,"hspeed":-1,"hview":360,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":640,"wview":640,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":360,"hspeed":-1,"hview":360,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":640,"wview":640,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":360,"hspeed":-1,"hview":360,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":640,"wview":640,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":360,"hspeed":-1,"hview":360,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":640,"wview":640,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":360,"hspeed":-1,"hview":360,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":640,"wview":640,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":360,"hspeed":-1,"hview":360,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":640,"wview":640,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings": {
    "clearDisplayBuffer": true,
    "clearViewBackground": true,
    "enableViews": true,
    "inheritViewSettings": true,
  },
  "volume": 1.0,
}