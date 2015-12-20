/**
 *  Java Grinder
 *  Author: Michael Kohn
 *   Email: mike@mikekohn.net
 *     Web: http://www.naken.cc/
 * License: GPL
 *
 * Copyright 2014-2015 by Michael Kohn
 *
 */

package net.mikekohn.java_grinder;

abstract public class Atari2600
{
  protected Atari2600()
  {
  }

  public static void waitHsync(int lines) { }
  public static void waitHsync() { }
  public static void startVblank() { }
  public static void waitVblank() { }
  public static void startOverscan() { }
  public static void waitOverscan() { }
  public static void setColorPlayer0(int color) { }
  public static void setColorPlayer1(int color) { }
  public static void setColorPlayfield(int color) { }
  public static void setColorBackground(int color) { }

  public static void resetPlayer0() { }
  public static void resetPlayer1() { }
  public static void resetMissile0() { }
  public static void resetMissile1() { }
  public static void resetBall() { }
  public static void resetMissile0ToPlayer0On() { }
  public static void resetMissile1ToPlayer1On() { }
  public static void resetMissile0ToPlayer0Off() { }
  public static void resetMissile1ToPlayer1Off() { }
  public static void applyHorizontalMotion() { }
  public static void clearMotionRegisters() { }
  public static void clearCollisionLatches() { }

  public static void enableMissile0() { }
  public static void enableMissile1() { }
  public static void enableBall() { }
  public static void disableMissile0() { }
  public static void disableMissile1() { }
  public static void disableBall() { }

  public static void enablePlayer0Reflect() { }
  public static void enablePlayer1Reflect() { }
  public static void disablePlayer0Reflect() { }
  public static void disablePlayer1Reflect() { }

  public static void setPlayfield0(byte value) { }
  public static void setPlayfield1(byte value) { }
  public static void setPlayfield2(byte value) { }
}
