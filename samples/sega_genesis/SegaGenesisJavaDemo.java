
import net.mikekohn.java_grinder.SegaGenesis;

public class SegaGenesisJavaDemo
{
/*
  public static int[] pattern =
  {
    // Pattern 0
    0x00000001, 0x00010000, 0x00000001, 0x00010000,
    0x00001000, 0x00000001, 0x00001000, 0x00000001,
  };
*/

  static public void main(String args[])
  {
    // Set font screen.
    SegaGenesis.setPalettePointer(49);
    SegaGenesis.setPaletteColor(0xeee);
    SegaGenesis.loadFonts();
    SegaGenesis.clearText();
    Common.wait(30);

    // Run parts of demo.
    ImageJavaGrinder.run();
    NakenLogo.run();
    Stars.run();
    Box.run();
    ImageInside.run();
    //Model.run();

    //SegaGenesis.setCursor(0, 0);
    //SegaGenesis.print("ABCD");

    SegaGenesis.setSpritePosition(0, 150, 150);
    SegaGenesis.setSpriteConfig1(0,
      SegaGenesis.SPRITE_CONFIG1_HORIZONTAL_SIZE_2_CELL |
      SegaGenesis.SPRITE_CONFIG1_VERTICAL_SIZE_2_CELL);
    SegaGenesis.setSpriteConfig2(0, 1120);

    SegaGenesis.initBitmap();

    Common.wait(60);

    SegaGenesis.loadZ80(PlaySong.z80_code);

    Mandelbrots.run();

    SegaGenesis.clearBitmap();

    //SegaGenesis.setPlotAddress(0);
    //SegaGenesis.fastPlot(1,2,3,4);

    SegaGenesis.clearText();
    SegaGenesis.setCursor(0, 7);
    SegaGenesis.print("MIKE[KOHN");
    SegaGenesis.setCursor(0, 1);
    SegaGenesis.print("JAVA[GRINDER");

    while(true)
    {
      int a,b;

      while(SegaGenesis.inVerticalBlank());

      for (b = 0; b < 4; b++)
      {
        for (a = 0; a < 0xf; a++)
        {
          SegaGenesis.setPalettePointer(49);
          SegaGenesis.setPaletteColor((a << 8) | (a << 4) | a);
          SegaGenesis.waitHorizontalBlank();
        }
      }

      SegaGenesis.waitVerticalBlank();
    }
  }
}

