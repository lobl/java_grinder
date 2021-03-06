
import net.mikekohn.java_grinder.amiga.Blitter;
import net.mikekohn.java_grinder.amiga.Copper;

/*
 ---------- BMP Info Header ----------
            size: 108
           width: 112
          height: 68

Total Colors: 8
*/

public class ImageJavaGrinder
{
  static public void init(Copper copper, Blitter blitter)
  {
    int n;

    for (n = 8; n < palette.length + 8; n++)
    {
      Display.setPalette(copper, n, palette[n - 8]);
    }

    // 320 / 8 = 40, 40 - (width / 8) = 26.
    blitter.setModuloDestination(26);
  }

  static public int getCenter()
  {
    return 8000 + (4000 - (28 * 40)) + (20 - 6);
  }

  static public short[] palette =
  {
    //0x000, 0x888, 0x333, 0x444, 0x666, 0xddd, 0xccc, 0xaaa,
    0x000, 0xaaa, 0x888, 0x999, 0xbbb, 0xfff, 0xeee, 0xccc,
  };

  static public byte[] bitplane_0 =
  {
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 2, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 8, 2, -128, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 2, 64, 48, 0, 0, 64,
    0, 0, 0, 0, 0, 0, 0, 24,
    4, 96, 48, 3, 0, -64, 0, 0,
    0, 0, 0, 0, 0, 8, 6, 0,
    16, 1, 0, -32, 0, 0, 0, 0,
    0, 0, 0, 12, 6, 48, 12, 1,
    1, -80, 0, 0, 0, 0, 0, 0,
    0, 0, 6, 8, 0, 2, 1, -104,
    0, 0, 0, 0, 0, 0, 0, 12,
    2, 0, 6, 3, 3, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 4, 12,
    3, 2, 7, 0, 0, 0, 0, 0,
    0, 0, 0, 12, 4, 4, 0, 6,
    6, 12, 0, 0, 0, 0, 0, 0,
    0, 4, 4, 6, 1, -122, 14, 6,
    0, 0, 0, 0, 0, 0, 0, 6,
    6, 2, 0, 66, 7, -10, 0, 0,
    0, 0, 0, 0, 0, 4, 15, -25,
    0, -58, 10, -33, -128, 0, 0, 0,
    0, 0, 0, 0, 4, -33, 0, 100,
    0, 2, -128, 0, 0, 0, 0, 0,
    0, 6, 12, 3, -128, 108, 48, 1,
    -128, 0, 0, 0, 0, 0, 0, 6,
    12, 1, -128, 24, 48, 0, -64, 0,
    0, 0, 0, 0, 0, 2, 12, 0,
    -128, 28, 112, 0, -64, 0, 0, 0,
    0, 0, 0, 4, 8, 0, -128, 56,
    48, 0, 64, 0, 0, 0, 0, 0,
    19, -2, 12, 0, 0, 24, 32, 0,
    96, 0, 0, 0, 0, 0, 31, -4,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 20, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, -66, 0, -128, 0, 0,
    0, 0, 0, 0, 0, 15, -128, 0,
    1, -126, 1, -4, 0, 0, 0, 0,
    0, 0, 1, 31, -16, 0, 1, -128,
    1, -66, 0, 0, 0, 52, 0, 0,
    -15, -64, 8, 0, 1, 0, 1, -126,
    0, 8, 0, 31, -128, 63, -80, -64,
    0, 0, 2, 0, 0, -127, -125, 24,
    4, 12, -64, 62, 0, -64, 4, 0,
    2, 0, 0, 64, -127, 30, 6, 8,
    -64, 48, 0, -128, 4, 0, 12, 0,
    0, -127, -126, 15, 6, 12, 48, 16,
    0, 96, 0, 0, 12, 0, 0, 64,
    -127, 11, -125, 8, 16, 24, 0, 96,
    16, 0, 24, 0, 0, -61, 1, 5,
    1, 4, 4, 8, 0, 32, 56, 0,
    24, 0, 0, 71, 1, 8, 66, 12,
    12, 8, 0, 16, 80, 0, 24, 0,
    0, -22, 0, -124, -29, 4, 4, 16,
    0, 61, -64, 0, 16, 0, 0, 112,
    1, -120, 65, 4, 4, 24, 0, 62,
    0, 0, 16, 31, 0, -8, 1, 4,
    17, 2, 2, 31, 16, 19, 64, 0,
    16, 31, -16, 34, 1, 4, 57, 4,
    1, 27, -8, 17, -32, 0, 8, 1,
    64, 97, -63, 2, 17, 2, 2, 25,
    -32, 8, 32, 0, 24, 1, -128, 64,
    97, -124, 9, 4, 2, 24, 0, 0,
    28, 0, 24, 1, -128, 64, 0, -126,
    3, 2, 0, 24, 0, 24, 12, 0,
    8, 1, -128, 32, 48, -124, 7, 2,
    3, 16, 0, 24, 4, 0, 8, 3,
    0, 32, 8, -126, 7, 7, 4, 0,
    0, 8, 1, 0, 6, 7, 0, 32,
    1, -125, 1, 2, 30, 6, 6, 8,
    3, 0, 1, -2, 0, 96, 8, 3,
    2, 7, -12, 31, -2, 8, 0, -128,
    1, 112, 0, 0, 0, 0, 0, 0,
    -48, 16, 0, 8, 1, -64, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, -128, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
  };

  static public byte[] bitplane_1 =
  {
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    7, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 56, 1, -128,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 16, 1, -128, 96, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 8, 1, -128, 16, 3, 0, 64,
    0, 0, 0, 0, 0, 0, 0, 20,
    2, -96, 40, 2, -128, 0, 0, 0,
    0, 0, 0, 0, 0, 20, 2, 32,
    12, 0, -127, 16, 0, 0, 0, 0,
    0, 0, 0, 4, 0, 32, 12, 0,
    -128, 48, 0, 0, 0, 0, 0, 0,
    0, 8, 4, 56, 12, 1, 2, -88,
    0, 0, 0, 0, 0, 0, 0, 0,
    4, 12, 5, 0, 2, -120, 0, 0,
    0, 0, 0, 0, 0, 4, 0, 8,
    1, 4, 4, 8, 0, 0, 0, 0,
    0, 0, 0, 8, 0, 10, 3, 5,
    5, 10, 0, 0, 0, 0, 0, 0,
    0, 10, 0, 0, 1, 64, 11, 2,
    0, 0, 0, 0, 0, 0, 0, 10,
    9, -59, 0, -124, 8, 64, 0, 0,
    0, 0, 0, 0, 0, 0, 8, 23,
    0, -86, 2, 96, 64, 0, 0, 0,
    0, 0, 0, 4, 0, -64, -128, 66,
    24, 7, 64, 0, 0, 0, 0, 0,
    0, 4, 0, 7, 0, 92, 32, 1,
    64, 0, 0, 0, 0, 0, 0, 4,
    12, 1, 64, 48, 40, 0, -128, 0,
    0, 0, 0, 0, 0, 4, 0, 1,
    0, 4, 64, 0, -96, 0, 0, 0,
    0, 0, 0, 0, 16, 0, -128, 32,
    16, 0, 0, 0, 0, 0, 0, 0,
    11, -14, 12, 0, 0, 32, 32, 0,
    0, 0, 0, 0, 0, 0, 24, 4,
    0, 0, 0, 16, 0, 0, 64, 0,
    0, 0, 0, 0, 1, -16, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 12, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, -46, 0, -16, 0, 0,
    0, 0, 0, 0, 0, 32, -96, 0,
    1, 102, 0, 12, 0, 0, 0, 0,
    0, 0, 1, 36, -128, 0, 2, -128,
    0, 51, 0, 0, 0, 6, 0, 6,
    77, 40, 88, 0, 3, 0, 1, 7,
    -125, 20, 0, 1, -128, 40, 97, 0,
    24, 0, 1, 0, 1, 65, 0, 22,
    8, 5, 32, 3, 0, 0, 4, 0,
    4, 0, 0, -63, 64, 18, 2, 20,
    -80, 32, 0, -64, 4, 0, 10, 0,
    0, 1, 67, 20, 4, 4, 104, 16,
    0, 32, 24, 0, 8, 0, 0, 1,
    2, 22, -127, 0, 24, 0, 0, 0,
    28, 0, 20, 0, 0, -64, -126, -116,
    -61, 0, 8, 8, 0, 64, 72, 0,
    24, 0, 0, -115, 0, -128, -128, 12,
    10, 8, 0, 49, 48, 0, 8, 0,
    0, -90, 1, -128, -96, 8, 4, 24,
    0, 46, 32, 0, 40, 0, 0, -116,
    1, -116, 32, 2, 6, 16, 0, 33,
    -128, 0, 40, 31, -16, -76, 1, 8,
    97, 6, 5, 23, -8, 34, -64, 0,
    40, 32, 0, 105, -127, 2, 41, 0,
    3, 20, 0, 17, -112, 0, 24, 60,
    64, 98, 65, 6, 8, 0, 0, 17,
    -16, 0, 24, 0, 0, 0, -128, 0,
    33, -128, 16, 6, 0, 16, 0, 8,
    52, 0, 20, 0, -128, 0, 49, -128,
    4, 4, 2, 16, 0, 16, 10, 0,
    8, 0, 0, 0, 17, -122, 5, 5,
    5, 24, 0, 16, 7, 0, 14, 2,
    0, 0, 57, -123, 5, 5, 6, 8,
    0, 20, 6, 0, 7, 8, -128, 32,
    9, -123, 3, 4, -6, 14, 2, 20,
    2, 0, 6, 33, 0, 64, 20, 1,
    0, 6, 12, 0, 0, 20, 1, 0,
    1, 4, 0, 0, 8, 2, 3, 1,
    -48, 23, 0, 16, 1, 64, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 64, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
  };

  static public byte[] bitplane_2 =
  {
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    2, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 16, 7, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 16, 7, -128, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 24, 6, -128, 96, 0, 0, -64,
    0, 0, 0, 0, 0, 0, 0, 8,
    2, 64, 48, 1, 0, 96, 0, 0,
    0, 0, 0, 0, 0, 8, 2, 96,
    8, 3, 0, -32, 0, 0, 0, 0,
    0, 0, 0, 8, 0, 32, 12, 3,
    0, -16, 0, 0, 0, 0, 0, 0,
    0, 12, 4, 16, 6, 1, 1, -112,
    0, 0, 0, 0, 0, 0, 0, 0,
    4, 24, 2, 2, 3, 24, 0, 0,
    0, 0, 0, 0, 0, 12, 6, 8,
    1, 3, 2, 12, 0, 0, 0, 0,
    0, 0, 0, 4, 6, 4, 1, -126,
    6, 4, 0, 0, 0, 0, 0, 0,
    0, 4, 6, 0, 0, -126, 6, 2,
    0, 0, 0, 0, 0, 0, 0, 4,
    4, 2, 0, -124, 15, -53, 0, 0,
    0, 0, 0, 0, 0, 6, 7, -5,
    0, 68, 29, 127, -128, 0, 0, 0,
    0, 0, 0, 6, 15, 47, 0, 76,
    24, 1, -128, 0, 0, 0, 0, 0,
    0, 4, 4, 1, 0, 44, 24, 0,
    -128, 0, 0, 0, 0, 0, 0, 4,
    12, 0, -128, 60, 48, 0, -128, 0,
    0, 0, 0, 0, 0, 4, 8, 0,
    -64, 56, 32, 0, 64, 0, 0, 0,
    0, 0, 0, 6, 12, 0, -64, 24,
    96, 0, 96, 0, 0, 0, 0, 0,
    12, 4, 8, 0, 0, 16, 0, 0,
    32, 0, 0, 0, 0, 0, 15, -4,
    0, 0, 0, 0, 0, 0, 32, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 56, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 116, 1, 0, 0, 0,
    0, 0, 0, 0, 0, 23, -64, 0,
    0, -64, 0, -8, 0, 0, 0, 0,
    0, 0, 0, -4, -32, 0, 1, -128,
    0, -58, 0, 0, 0, 8, 0, 1,
    120, -16, 56, 0, 3, 0, 0, -125,
    0, 0, 4, 63, 0, 15, -24, -128,
    12, 0, 6, 0, 0, -127, 0, 12,
    6, 27, -128, 24, 0, 0, 12, 0,
    4, 0, 0, -128, -126, 14, 2, 8,
    96, 24, 0, 64, 12, 0, 4, 0,
    0, 64, -127, 10, 2, 8, 48, 24,
    0, 64, 12, 0, 8, 0, 0, -127,
    1, 9, 2, 4, 24, 0, 0, 0,
    24, 0, 8, 0, 0, 65, 1, 8,
    -126, 8, 8, 24, 0, 32, 16, 0,
    24, 0, 0, 70, 1, 4, -127, 4,
    4, 24, 0, 32, -32, 0, 16, 0,
    0, 92, 1, 8, 64, 4, 6, 8,
    0, 63, -128, 0, 16, 0, 0, -8,
    1, 4, 34, 4, 2, 8, 0, 63,
    0, 0, 16, 32, 0, 126, 1, -124,
    35, 4, 2, 8, 0, 31, -128, 0,
    16, 63, -16, 71, 1, -124, 19, 2,
    2, 15, -16, 24, -64, 0, 16, 3,
    -80, 64, -127, -124, 10, 4, 1, 14,
    0, 16, 112, 0, 0, 1, 0, 32,
    -63, 2, 14, 2, 1, 8, 0, 24,
    24, 0, 8, 1, -128, 32, 97, 4,
    12, 2, 3, 8, 0, 8, 12, 0,
    12, 1, -128, 64, 17, 2, 7, 2,
    2, 8, 0, 8, 6, 0, 4, 1,
    -128, 64, 17, 2, 3, 2, 6, 24,
    0, 8, 2, 0, 6, 3, 0, 96,
    25, 2, 2, 7, 12, 25, -8, 8,
    1, -128, 3, -4, 0, 0, 8, 2,
    1, 3, -8, 15, -4, 8, 1, -128,
    0, -120, 0, 0, 0, 0, 0, 0,
    32, 8, 0, 8, 0, -128, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
  };

/*
  static public void show(Copper copper)
  {
    copper.stop();
    copper.resetIndex();
    copper.appendSetBitplane(0, bitplane_0);
    copper.appendSetBitplane(1, bitplane_1);
    copper.appendSetBitplane(2, bitplane_2);
    copper.appendSetColor(0, palette[0]);
    copper.appendSetColor(1, palette[1]);
    copper.appendSetColor(2, palette[2]);
    copper.appendSetColor(3, palette[3]);
    copper.appendSetColor(4, palette[4]);
    copper.appendSetColor(5, palette[5]);
    copper.appendSetColor(6, palette[6]);
    copper.appendSetColor(7, palette[7]);
    copper.appendEnd();
    copper.run();
  }
*/
}

