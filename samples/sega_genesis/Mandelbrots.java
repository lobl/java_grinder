
import net.mikekohn.java_grinder.SegaGenesis;

public class Mandelbrots
{
  public static short[] palette =
  {
    0x000, 0x04e, 0x044, 0x040, 0x440, 0x880, 0x808, 0xe0e,
    0xe4e, 0x02e, 0x88e, 0x444, 0xe40, 0xee0, 0x400, 0x000,
  };

  public static void run()
  {
    final int DEC_PLACE = 10;
    int x,y;
    int rs,is;
    int zi,zr;
    int tr,ti;
    int zr2,zi2;
    int count;
    final int r0 = (-2 << DEC_PLACE);
    final int i0 = (-1 << DEC_PLACE);
    final int r1 = (1 << DEC_PLACE);
    final int i1 = (1 << DEC_PLACE);
    int dx = (r1 - r0) / 320;
    int dy = (i1 - i0) / 224;

    SegaGenesis.initBitmap();
    SegaGenesis.setPaletteColors(Mandelbrots.palette);

    is = i0;

    for (y = 0; y < 224; y++)
    {
      rs = r0;

      for (x = 0; x < 320; x++)
      {
        zr = 0;
        zi = 0;

        for (count = 0; count < 16; count++)
        {
          zr2 = (zr * zr) >> DEC_PLACE;
          zi2 = (zi * zi) >> DEC_PLACE;

          if (zr2 + zi2 > (4 << DEC_PLACE)) { break; }

          tr = zr2 - zi2;
          ti = 2 * ((zr * zi) >> DEC_PLACE);

          zr = tr + rs;
          zi = ti + is;
        }

        //if (count == 16) { count = 15; }

        if (count < 15)
        {
          SegaGenesis.plot(x, y, count);
        }

        rs += dx;
      }

      is += dy;
    }

    Common.wait(60);
  }
}

