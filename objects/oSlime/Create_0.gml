/// @description Insert description here
// You can write your code in this editor
// Inherit the parent event
event_inherited();

state = enemystate.wander;

sprMove = sSlime;
sprAttack = sSlimeAttack;
sprDie = sSlimeDie;
sprHurt = sSlimeHurt;


enemyScript[enemystate.wander] = SlimeWander;
enemyScript[enemystate.chase] = SlimeChase;
enemyScript[enemystate.attack] = SlimeAttack;
enemyScript[enemystate.hurt] = GenericEnemyHurt;
enemyScript[enemystate.die] = GenericEnemyDie;

entityDropList = choose
(
[oArrowDrop],
[oArrowDrop],
[oHeartDrop],
[oHeartDrop],
[oHeartDrop],
[oHeartDrop, oHeartDrop],
[oHeartDrop, oHeartDrop],
[oHeartDrop, oHeartDrop, oHeartDrop],
[oCoin, oCoin, oCoin],
[oCoin, oCoin, oCoin],
[oCoin, oCoin, oCoin],
[oCoin, oCoin, oCoin],
[oBombDrop],
[oBombDrop],
[oBombDrop],
);
