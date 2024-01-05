/// @description Insert description here
// You can write your code in this editor
// Inherit the parent event
event_inherited();

state = enemystate.wander;

sprMove = sBat;
sprAttack = sBat;
sprDie = sBatDie;
sprHurt = sBatHurt;


enemyScript[enemystate.wander] = BatWander;
enemyScript[enemystate.chase] = BatChase;
enemyScript[enemystate.attack] = -1;
enemyScript[enemystate.hurt] = GenericEnemyHurt;
enemyScript[enemystate.die] = GenericEnemyDie;

entityDropList = choose
(
[oArrowDrop],
[oArrowDrop],
[oArrowDrop],
[oArrowDrop],
[oCoin, oCoin, oCoin],
[oCoin, oCoin, oCoin],
[oCoin, oCoin, oCoin],
[oCoin, oCoin, oCoin]
);
