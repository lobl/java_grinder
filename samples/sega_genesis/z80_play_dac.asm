.z80

FM1_REG_SEL equ 0x4000
FM1_REG_DATA equ 0x4001
FM2_REG_SEL equ 0x4002
FM2_REG_DATA equ 0x4003

DAC_DATA equ 0x2a
DAC_ENABLE equ 0x2b

start:
  ;; Set Yamaha 2612 into DAC mode for channel 6
  ld a, DAC_ENABLE
  ld (FM1_REG_SEL), a
  ld a, 0x80
  ld (FM1_REG_DATA), a

  ;; Point to data
  ld ix, data

  ;; Read data and play through DAC
  ld hl, data_end - data
play_loop:
  ld a, DAC_DATA
  ld (FM1_REG_SEL), a
  ld a, (ix)
  ld (FM1_REG_DATA), a
  inc ix
  ;; 4000000MHz / 4000 samples = 1000 cycles delay per sample
  ;; (7 + 13 + 19 + 10 + 6 + 12 + 7) = 74
  ;; (1000 - 74) / 13 = 71 loops
  ld b, 71
play_loop_delay:
  djnz play_loop_delay
  dec hl
  jr nz, play_loop

while_1:
  jp while_1

data:
  db 0x7f, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80
  db 0x7f, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80
  db 0x7f, 0x80, 0x81, 0x80, 0x80, 0x81, 0x80, 0x81
  db 0x80, 0x81, 0x7f, 0x80, 0x80, 0x81, 0x80, 0x80
  db 0x81, 0x81, 0x7f, 0x80, 0x80, 0x80, 0x80, 0x80
  db 0x7f, 0x81, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80
  db 0x80, 0x80, 0x80, 0x80, 0x7f, 0x80, 0x80, 0x80
  db 0x80, 0x80, 0x80, 0x7f, 0x81, 0x80, 0x80, 0x80
  db 0x81, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80
  db 0x80, 0x80, 0x80, 0x81, 0x80, 0x80, 0x80, 0x80
  db 0x80, 0x80, 0x81, 0x7f, 0x80, 0x80, 0x80, 0x7f
  db 0x7f, 0x80, 0x80, 0x7f, 0x7f, 0x7f, 0x7f, 0x80
  db 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x7f, 0x80
  db 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x81, 0x7f
  db 0x80, 0x7f, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80
  db 0x80, 0x80, 0x80, 0x80, 0x7f, 0x80, 0x80, 0x80
  db 0x80, 0x80, 0x80, 0x7f, 0x80, 0x80, 0x81, 0x80
  db 0x80, 0x80, 0x80, 0x80, 0x7f, 0x80, 0x80, 0x80
  db 0x80, 0x80, 0x80, 0x80, 0x81, 0x80, 0x80, 0x80
  db 0x80, 0x80, 0x80, 0x80, 0x80, 0x81, 0x80, 0x80
  db 0x80, 0x80, 0x80, 0x81, 0x80, 0x80, 0x80, 0x81
  db 0x80, 0x80, 0x81, 0x80, 0x80, 0x7f, 0x80, 0x80
  db 0x80, 0x81, 0x80, 0x7f, 0x80, 0x80, 0x80, 0x81
  db 0x80, 0x81, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80
  db 0x80, 0x80, 0x81, 0x80, 0x81, 0x80, 0x80, 0x7f
  db 0x7f, 0x80, 0x81, 0x80, 0x80, 0x80, 0x80, 0x80
  db 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80
  db 0x80, 0x80, 0x81, 0x80, 0x80, 0x7f, 0x80, 0x80
  db 0x80, 0x80, 0x81, 0x80, 0x80, 0x80, 0x81, 0x80
  db 0x80, 0x80, 0x81, 0x80, 0x81, 0x80, 0x80, 0x80
  db 0x80, 0x80, 0x80, 0x7f, 0x7f, 0x7f, 0x7f, 0x80
  db 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x81, 0x80
  db 0x80, 0x7f, 0x80, 0x81, 0x80, 0x7f, 0x80, 0x80
  db 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80
  db 0x80, 0x80, 0x81, 0x7f, 0x7f, 0x80, 0x80, 0x80
  db 0x7f, 0x7f, 0x80, 0x80, 0x7f, 0x80, 0x80, 0x80
  db 0x80, 0x80, 0x80, 0x80, 0x80, 0x7f, 0x80, 0x80
  db 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80
  db 0x80, 0x80, 0x80, 0x81, 0x80, 0x80, 0x80, 0x7f
  db 0x80, 0x81, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80
  db 0x80, 0x81, 0x80, 0x7f, 0x80, 0x7f, 0x80, 0x80
  db 0x80, 0x80, 0x81, 0x81, 0x80, 0x80, 0x80, 0x80
  db 0x80, 0x80, 0x80, 0x80, 0x80, 0x7f, 0x80, 0x7f
  db 0x80, 0x80, 0x80, 0x7f, 0x80, 0x80, 0x7f, 0x80
  db 0x80, 0x80, 0x80, 0x81, 0x80, 0x80, 0x7f, 0x80
  db 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80
  db 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80
  db 0x80, 0x7f, 0x80, 0x80, 0x80, 0x81, 0x80, 0x80
  db 0x80, 0x7f, 0x80, 0x81, 0x80, 0x80, 0x81, 0x7f
  db 0x80, 0x80, 0x80, 0x7f, 0x7f, 0x81, 0x80, 0x80
  db 0x80, 0x81, 0x80, 0x81, 0x80, 0x80, 0x80, 0x80
  db 0x80, 0x81, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80
  db 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80
  db 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80
  db 0x7f, 0x80, 0x80, 0x80, 0x80, 0x7f, 0x81, 0x80
  db 0x80, 0x80, 0x80, 0x81, 0x80, 0x80, 0x80, 0x80
  db 0x80, 0x81, 0x80, 0x81, 0x80, 0x7f, 0x80, 0x80
  db 0x80, 0x80, 0x80, 0x81, 0x80, 0x80, 0x80, 0x80
  db 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80
  db 0x7f, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80
  db 0x80, 0x81, 0x80, 0x80, 0x7f, 0x80, 0x7f, 0x80
  db 0x7f, 0x80, 0x7f, 0x82, 0x7e, 0x72, 0x79, 0x80
  db 0x86, 0x89, 0x8c, 0x8b, 0x88, 0x86, 0x83, 0x80
  db 0x7f, 0x7d, 0x7b, 0x7b, 0x7b, 0x7e, 0x7d, 0x7d
  db 0x7e, 0x7e, 0x7e, 0x7e, 0x7e, 0x7e, 0x7e, 0x7e
  db 0x7f, 0x80, 0x80, 0x81, 0x82, 0x82, 0x82, 0x82
  db 0x81, 0x80, 0x81, 0x7f, 0x80, 0x81, 0x81, 0x82
  db 0x82, 0x82, 0x82, 0x83, 0x82, 0x82, 0x81, 0x82
  db 0x81, 0x80, 0x81, 0x7f, 0x80, 0x7f, 0x7f, 0x7f
  db 0x7f, 0x7f, 0x80, 0x80, 0x80, 0x80, 0x80, 0x7f
  db 0x80, 0x7f, 0x80, 0x7f, 0x80, 0x81, 0x81, 0x7f
  db 0x7f, 0x80, 0x80, 0x7e, 0x80, 0x7f, 0x80, 0x80
  db 0x80, 0x80, 0x80, 0x80, 0x81, 0x7f, 0x80, 0x80
  db 0x80, 0x80, 0x7f, 0x80, 0x7f, 0x80, 0x81, 0x82
  db 0x81, 0x81, 0x80, 0x80, 0x7f, 0x7f, 0x81, 0x80
  db 0x80, 0x80, 0x81, 0x7f, 0x81, 0x80, 0x80, 0x80
  db 0x80, 0x80, 0x80, 0x80, 0x7f, 0x80, 0x80, 0x7f
  db 0x80, 0x81, 0x7f, 0x7e, 0x80, 0x7f, 0x7e, 0x80
  db 0x80, 0x81, 0x81, 0x80, 0x81, 0x80, 0x82, 0x81
  db 0x81, 0x81, 0x81, 0x80, 0x7f, 0x80, 0x7e, 0x7f
  db 0x81, 0x80, 0x7e, 0x7d, 0x81, 0x81, 0x82, 0x81
  db 0x82, 0x83, 0x81, 0x84, 0x81, 0x80, 0x7f, 0x7e
  db 0x7d, 0x7e, 0x7e, 0x7e, 0x80, 0x80, 0x7f, 0x7e
  db 0x80, 0x7f, 0x80, 0x80, 0x81, 0x84, 0x81, 0x7f
  db 0x7b, 0x7b, 0x7b, 0x7c, 0x80, 0x83, 0x84, 0x82
  db 0x84, 0x7e, 0x7c, 0x80, 0x81, 0x87, 0x87, 0x88
  db 0x84, 0x82, 0x82, 0x7f, 0x82, 0x81, 0x80, 0x80
  db 0x7c, 0x7d, 0x7a, 0x77, 0x7a, 0x78, 0x7e, 0x83
  db 0x81, 0x84, 0x83, 0x84, 0x81, 0x7e, 0x7c, 0x78
  db 0x74, 0x74, 0x76, 0x76, 0x78, 0x7b, 0x86, 0x89
  db 0x8e, 0x90, 0x94, 0x8f, 0x8e, 0x94, 0x87, 0x88
  db 0x83, 0x7b, 0x7b, 0x76, 0x6f, 0x6f, 0x6a, 0x6c
  db 0x75, 0x77, 0x7a, 0x84, 0x89, 0x8d, 0x97, 0x98
  db 0xa7, 0xaf, 0xa5, 0x93, 0x8b, 0x79, 0x62, 0x5d
  db 0x52, 0x54, 0x61, 0x69, 0x78, 0x7c, 0x73, 0x79
  db 0x76, 0x7d, 0x8d, 0xa3, 0xb7, 0xa7, 0x95, 0x92
  db 0x72, 0x56, 0x65, 0x55, 0x6a, 0x86, 0x85, 0x91
  db 0x83, 0x71, 0x74, 0x80, 0x84, 0xa7, 0xb9, 0xa6
  db 0x9c, 0x92, 0x62, 0x56, 0x6c, 0x62, 0x86, 0xa6
  db 0x91, 0x90, 0x77, 0x53, 0x62, 0x65, 0x84, 0xa2
  db 0x9b, 0x8e, 0x8c, 0x6d, 0x52, 0x66, 0x6b, 0x72
  db 0x98, 0xa6, 0x95, 0x7c, 0x60, 0x71, 0x72, 0x86
  db 0xa4, 0x9c, 0x9b, 0x8b, 0x7b, 0x6c, 0x63, 0x70
  db 0x8c, 0x9a, 0x8e, 0x8f, 0x7c, 0x5e, 0x69, 0x70
  db 0x78, 0x9b, 0x9a, 0x92, 0x92, 0x74, 0x61, 0x70
  db 0x6b, 0x7e, 0x9d, 0x9b, 0x8d, 0x74, 0x72, 0x6f
  db 0x74, 0x86, 0x91, 0x97, 0x95, 0x8a, 0x91, 0x6d
  db 0x61, 0x71, 0x76, 0x90, 0x8f, 0x8a, 0x6f, 0x6e
  db 0x78, 0x74, 0x90, 0x98, 0x84, 0x88, 0x7f, 0x72
  db 0x87, 0x97, 0x74, 0x71, 0x8a, 0x6d, 0x73, 0x94
  db 0x96, 0x6f, 0x7b, 0x86, 0x6d, 0x7a, 0x89, 0x8a
  db 0x8d, 0x90, 0x87, 0x88, 0x7e, 0x5f, 0x62, 0x7d
  db 0x7d, 0x7f, 0x95, 0x85, 0x6b, 0x7c, 0x7e, 0x72
  db 0x83, 0x9d, 0x80, 0x8a, 0x94, 0x6d, 0x7d, 0x90
  db 0x78, 0x69, 0x86, 0x80, 0x70, 0x8c, 0x8e, 0x74
  db 0x72, 0x85, 0x7f, 0x76, 0x8e, 0x87, 0x72, 0x7d
  db 0x88, 0x8a, 0x95, 0x84, 0x71, 0x70, 0x88, 0x82
  db 0x83, 0x94, 0x7b, 0x6e, 0x80, 0x8b, 0x6e, 0x82
  db 0x93, 0x7f, 0x83, 0x90, 0x81, 0x85, 0x75, 0x66
  db 0x73, 0x85, 0x88, 0x81, 0x82, 0x6c, 0x71, 0x82
  db 0x91, 0x83, 0x7d, 0x77, 0x77, 0x83, 0x93, 0x8b
  db 0x8a, 0x8b, 0x71, 0x71, 0x7e, 0x91, 0x79, 0x84
  db 0x83, 0x6c, 0x74, 0x89, 0x8f, 0x74, 0x7a, 0x8d
  db 0x86, 0x87, 0x8c, 0x88, 0x75, 0x66, 0x83, 0x92
  db 0x85, 0x85, 0x7d, 0x6a, 0x71, 0x8a, 0x90, 0x7b
  db 0x73, 0x73, 0x78, 0x8c, 0x97, 0x88, 0x8a, 0x80
  db 0x6a, 0x74, 0x8b, 0x91, 0x7d, 0x76, 0x77, 0x74
  db 0x84, 0x94, 0x7e, 0x71, 0x82, 0x91, 0x84, 0x89
  db 0x8b, 0x73, 0x6b, 0x7f, 0x8f, 0x7e, 0x80, 0x80
  db 0x6b, 0x75, 0x8c, 0x8d, 0x75, 0x72, 0x7b, 0x7b
  db 0x8f, 0x94, 0x8c, 0x7c, 0x70, 0x75, 0x8c, 0x91
  db 0x88, 0x76, 0x71, 0x77, 0x83, 0x94, 0x87, 0x71
  db 0x76, 0x8b, 0x8a, 0x85, 0x89, 0x7b, 0x67, 0x79
  db 0x8e, 0x88, 0x7a, 0x7d, 0x74, 0x6f, 0x86, 0x95
  db 0x80, 0x6f, 0x7d, 0x7c, 0x82, 0x93, 0x91, 0x7d
  db 0x71, 0x79, 0x8e, 0x8f, 0x89, 0x7c, 0x6c, 0x74
  db 0x84, 0x91, 0x86, 0x73, 0x6f, 0x7b, 0x8a, 0x8f
  db 0x87, 0x89, 0x77, 0x69, 0x7f, 0x8c, 0x84, 0x73
  db 0x79, 0x79, 0x74, 0x8e, 0x90, 0x77, 0x73, 0x8e
  db 0x89, 0x77, 0x8a, 0x8c, 0x75, 0x74, 0x85, 0x81
  db 0x7f, 0x8f, 0x84, 0x6f, 0x76, 0x8c, 0x87, 0x7f
  db 0x82, 0x77, 0x78, 0x83, 0x91, 0x82, 0x83, 0x89
  db 0x72, 0x71, 0x83, 0x91, 0x7b, 0x75, 0x7f, 0x75
  db 0x78, 0x91, 0x88, 0x71, 0x80, 0x91, 0x83, 0x7c
  db 0x8a, 0x7d, 0x6d, 0x7e, 0x8e, 0x81, 0x7a, 0x81
  db 0x78, 0x75, 0x89, 0x91, 0x7c, 0x75, 0x81, 0x7e
  db 0x81, 0x8d, 0x88, 0x75, 0x87, 0x8d, 0x73, 0x73
  db 0x89, 0x8d, 0x76, 0x7a, 0x85, 0x78, 0x76, 0x8c
  db 0x7e, 0x72, 0x85, 0x91, 0x88, 0x88, 0x7f, 0x6b
  db 0x78, 0x8c, 0x8c, 0x7b, 0x78, 0x74, 0x75, 0x87
  db 0x93, 0x81, 0x72, 0x7b, 0x83, 0x8b, 0x8e, 0x89
  db 0x77, 0x6d, 0x7e, 0x8d, 0x8b, 0x87, 0x76, 0x6e
  db 0x76, 0x89, 0x8e, 0x77, 0x73, 0x79, 0x82, 0x8f
  db 0x90, 0x7c, 0x72, 0x7d, 0x8f, 0x89, 0x86, 0x81
  db 0x70, 0x6f, 0x80, 0x8f, 0x84, 0x86, 0x81, 0x6e
  db 0x75, 0x8a, 0x87, 0x71, 0x77, 0x86, 0x7d, 0x83
  db 0x8e, 0x7c, 0x72, 0x83, 0x8c, 0x7e, 0x7a, 0x84
  db 0x7c, 0x7f, 0x8d, 0x8f, 0x83, 0x73, 0x74, 0x86
  db 0x8f, 0x88, 0x79, 0x72, 0x75, 0x82, 0x8b, 0x7d
  db 0x7d, 0x85, 0x84, 0x8b, 0x88, 0x70, 0x71, 0x87
  db 0x8f, 0x80, 0x7b, 0x7d, 0x70, 0x78, 0x8e, 0x87
  db 0x7c, 0x8a, 0x7c, 0x72, 0x88, 0x8b, 0x79, 0x70
  db 0x86, 0x8a, 0x7b, 0x8b, 0x81, 0x6f, 0x7b, 0x8d
  db 0x86, 0x73, 0x7e, 0x7e, 0x7b, 0x8b, 0x93, 0x85
  db 0x70, 0x72, 0x87, 0x8f, 0x86, 0x80, 0x73, 0x6f
  db 0x7d, 0x8e, 0x7f, 0x77, 0x88, 0x87, 0x8a, 0x86
  db 0x70, 0x70, 0x85, 0x8e, 0x83, 0x7c, 0x7c, 0x72
  db 0x78, 0x8f, 0x89, 0x76, 0x7f, 0x7c, 0x78, 0x8d
  db 0x8f, 0x7b, 0x70, 0x7c, 0x90, 0x8c, 0x89, 0x80
  db 0x6e, 0x75, 0x88, 0x8e, 0x78, 0x70, 0x76, 0x7a
  db 0x8a, 0x94, 0x89, 0x73, 0x72, 0x87, 0x91, 0x87
  db 0x86, 0x79, 0x6d, 0x77, 0x8d, 0x7f, 0x71, 0x8d
  db 0x87, 0x82, 0x89, 0x79, 0x68, 0x7c, 0x8f, 0x80
  db 0x77, 0x7e, 0x77, 0x7b, 0x8e, 0x8e, 0x77, 0x76
  db 0x82, 0x85, 0x8c, 0x8f, 0x88, 0x78, 0x6e, 0x79
  db 0x8c, 0x8d, 0x82, 0x71, 0x75, 0x7a, 0x8c, 0x8d
  db 0x7b, 0x72, 0x7a, 0x89, 0x94, 0x83, 0x72, 0x75
  db 0x87, 0x8e, 0x85, 0x87, 0x74, 0x6e, 0x7b, 0x87
  db 0x82, 0x84, 0x8c, 0x7c, 0x7c, 0x84, 0x73, 0x71
  db 0x87, 0x8b, 0x76, 0x75, 0x81, 0x7a, 0x82, 0x8f
  db 0x84, 0x75, 0x7c, 0x88, 0x88, 0x84, 0x8c, 0x8a
  db 0x79, 0x6e, 0x79, 0x8c, 0x8c, 0x7b, 0x74, 0x75
  db 0x76, 0x8a, 0x91, 0x7b, 0x74, 0x7d, 0x88, 0x90
  db 0x88, 0x77, 0x70, 0x81, 0x91, 0x8a, 0x87, 0x7a
  db 0x6e, 0x73, 0x83, 0x87, 0x7b, 0x88, 0x89, 0x86
  db 0x80, 0x6f, 0x6d, 0x82, 0x8a, 0x7e, 0x78, 0x78
  db 0x77, 0x7e, 0x91, 0x88, 0x76, 0x77, 0x82, 0x88
  db 0x8a, 0x8d, 0x8a, 0x79, 0x6e, 0x78, 0x8a, 0x8d
  db 0x7c, 0x71, 0x76, 0x7b, 0x8a, 0x91, 0x7e, 0x73
  db 0x78, 0x88, 0x8f, 0x8e, 0x7c, 0x6f, 0x77, 0x8a
  db 0x8d, 0x88, 0x7d, 0x71, 0x72, 0x7f, 0x8f, 0x76
  db 0x74, 0x8e, 0x8d, 0x89, 0x83, 0x70, 0x6e, 0x81
  db 0x8c, 0x87, 0x79, 0x72, 0x77, 0x7f, 0x92, 0x8b
  db 0x77, 0x76, 0x7d, 0x88, 0x8e, 0x8c, 0x85, 0x75
  db 0x70, 0x7c, 0x8a, 0x8a, 0x7a, 0x73, 0x77, 0x7c
  db 0x89, 0x90, 0x7b, 0x76, 0x7a, 0x89, 0x8e, 0x8a
  db 0x83, 0x72, 0x75, 0x83, 0x8c, 0x83, 0x7e, 0x71
  db 0x74, 0x7b, 0x90, 0x8a, 0x72, 0x7a, 0x8d, 0x8d
  db 0x88, 0x85, 0x70, 0x71, 0x7f, 0x8e, 0x88, 0x74
  db 0x72, 0x79, 0x7f, 0x93, 0x8d, 0x7a, 0x75, 0x7b
  db 0x8c, 0x8f, 0x8a, 0x81, 0x6f, 0x70, 0x82, 0x8f
  db 0x87, 0x73, 0x73, 0x76, 0x82, 0x91, 0x8c, 0x79
  db 0x73, 0x7a, 0x8b, 0x8e, 0x87, 0x83, 0x72, 0x70
  db 0x82, 0x8f, 0x83, 0x75, 0x75, 0x77, 0x7c, 0x8f
  db 0x8d, 0x7a, 0x73, 0x84, 0x91, 0x88, 0x8a, 0x7d
  db 0x6c, 0x76, 0x8b, 0x8c, 0x7a, 0x70, 0x78, 0x79
  db 0x88, 0x96, 0x85, 0x74, 0x76, 0x88, 0x8f, 0x8a
  db 0x88, 0x79, 0x6e, 0x75, 0x85, 0x8d, 0x7e, 0x71
  db 0x76, 0x7a, 0x87, 0x91, 0x8a, 0x78, 0x74, 0x80
  db 0x8c, 0x8f, 0x85, 0x87, 0x7b, 0x6c, 0x78, 0x8a
  db 0x88, 0x74, 0x72, 0x7d, 0x79, 0x87, 0x91, 0x85
  db 0x76, 0x7a, 0x8a, 0x8f, 0x87, 0x89, 0x7b, 0x6c
  db 0x76, 0x88, 0x8c, 0x77, 0x71, 0x78, 0x79, 0x87
  db 0x94, 0x87, 0x76, 0x79, 0x8b, 0x8e, 0x87, 0x88
  db 0x7d, 0x6f, 0x71, 0x83, 0x8c, 0x84, 0x7b, 0x74
  db 0x75, 0x82, 0x91, 0x89, 0x79, 0x75, 0x79, 0x82
  db 0x8f, 0x8b, 0x79, 0x83, 0x87, 0x72, 0x79, 0x8a
  db 0x8b, 0x76, 0x76, 0x85, 0x7d, 0x7b, 0x8f, 0x85
  db 0x75, 0x75, 0x86, 0x8e, 0x84, 0x87, 0x81, 0x6c
  db 0x74, 0x89, 0x8d, 0x7a, 0x70, 0x7a, 0x79, 0x82
  db 0x94, 0x89, 0x75, 0x76, 0x87, 0x8f, 0x85, 0x8a
  db 0x7d, 0x71, 0x73, 0x7f, 0x89, 0x89, 0x80, 0x73
  db 0x74, 0x7f, 0x8c, 0x8a, 0x7d, 0x76, 0x75, 0x7d
  db 0x8e, 0x8e, 0x7c, 0x7d, 0x8e, 0x7a, 0x72, 0x82
  db 0x8e, 0x7e, 0x74, 0x86, 0x7e, 0x74, 0x87, 0x90
  db 0x79, 0x71, 0x80, 0x8f, 0x89, 0x86, 0x86, 0x74
  db 0x6b, 0x7e, 0x8d, 0x83, 0x72, 0x78, 0x7a, 0x78
  db 0x8d, 0x92, 0x7f, 0x75, 0x80, 0x8b, 0x83, 0x8b
  db 0x8a, 0x73, 0x71, 0x7a, 0x83, 0x87, 0x8b, 0x7d
  db 0x72, 0x77, 0x88, 0x8c, 0x83, 0x7b, 0x78, 0x76
  db 0x82, 0x92, 0x86, 0x77, 0x87, 0x84, 0x72, 0x7a
  db 0x8c, 0x89, 0x72, 0x7d, 0x84, 0x74, 0x7c, 0x90
  db 0x85, 0x74, 0x79, 0x8b, 0x8f, 0x85, 0x87, 0x7d
  db 0x6c, 0x77, 0x8a, 0x88, 0x73, 0x73, 0x7b, 0x74
  db 0x84, 0x92, 0x89, 0x76, 0x78, 0x89, 0x87, 0x84
  db 0x8e, 0x80, 0x71, 0x74, 0x81, 0x8c, 0x8a, 0x80
  db 0x74, 0x71, 0x80, 0x8e, 0x8b, 0x7d, 0x75, 0x74
  db 0x7d, 0x8d, 0x8b, 0x7b, 0x87, 0x84, 0x6f, 0x78
  db 0x8b, 0x8d, 0x74, 0x78, 0x83, 0x76, 0x80, 0x91
  db 0x86, 0x73, 0x78, 0x8b, 0x8e, 0x87, 0x88, 0x7d
  db 0x6b, 0x75, 0x89, 0x89, 0x78, 0x73, 0x78, 0x76
  db 0x85, 0x92, 0x87, 0x75, 0x78, 0x85, 0x89, 0x8b
  db 0x8e, 0x7b, 0x71, 0x78, 0x7e, 0x8a, 0x8e, 0x83
  db 0x72, 0x73, 0x82, 0x8b, 0x8a, 0x84, 0x77, 0x73
  db 0x7d, 0x8d, 0x8a, 0x7c, 0x85, 0x87, 0x70, 0x73
  db 0x87, 0x8d, 0x77, 0x7a, 0x84, 0x74, 0x7a, 0x8d
  db 0x89, 0x76, 0x75, 0x85, 0x90, 0x88, 0x85, 0x82
  db 0x72, 0x6f, 0x82, 0x8c, 0x82, 0x77, 0x78, 0x76
  db 0x7e, 0x8f, 0x8e, 0x7a, 0x75, 0x78, 0x82, 0x8e
  db 0x8c, 0x84, 0x79, 0x7c, 0x75, 0x80, 0x90, 0x89
  db 0x76, 0x76, 0x7e, 0x7e, 0x8b, 0x8f, 0x7f, 0x6f
  db 0x77, 0x88, 0x88, 0x87, 0x8b, 0x81, 0x6e, 0x72
  db 0x87, 0x8d, 0x7b, 0x7f, 0x7c, 0x72, 0x7c, 0x8f
  db 0x89, 0x71, 0x75, 0x82, 0x8a, 0x88, 0x8c, 0x7f
  db 0x6f, 0x75, 0x8b, 0x8b, 0x87, 0x81, 0x71, 0x6f
  db 0x81, 0x8e, 0x8a, 0x77, 0x74, 0x77, 0x7c, 0x90
  db 0x90, 0x89, 0x76, 0x74, 0x7a, 0x89, 0x91, 0x85
  db 0x75, 0x74, 0x78, 0x84, 0x92, 0x8a, 0x77, 0x73
  db 0x78, 0x85, 0x8f, 0x8c, 0x81, 0x70, 0x75, 0x86
  db 0x8d, 0x86, 0x85, 0x71, 0x6d, 0x79, 0x8c, 0x83
  db 0x71, 0x7b, 0x7f, 0x86, 0x90, 0x89, 0x78, 0x72
  db 0x7f, 0x8d, 0x87, 0x89, 0x80, 0x71, 0x73, 0x85
  db 0x8b, 0x7d, 0x83, 0x7e, 0x70, 0x7e, 0x8d, 0x89
  db 0x78, 0x75, 0x79, 0x80, 0x8c, 0x91, 0x86, 0x74
  db 0x76, 0x7e, 0x88, 0x8e, 0x87, 0x7a, 0x73, 0x7c
  db 0x8d, 0x8d, 0x7a, 0x71, 0x79, 0x7e, 0x85, 0x8f
  db 0x8c, 0x78, 0x73, 0x7e, 0x82, 0x7a, 0x88, 0x8d
  db 0x7f, 0x81, 0x8a, 0x80, 0x6c, 0x78, 0x89, 0x7d
  db 0x7c, 0x8a, 0x7d, 0x6e, 0x7a, 0x8b, 0x77, 0x77
  db 0x8f, 0x83, 0x7c, 0x89, 0x88, 0x77, 0x6f, 0x82
  db 0x88, 0x7d, 0x89, 0x88, 0x74, 0x72, 0x82, 0x84
  db 0x7f, 0x89, 0x87, 0x76, 0x7c, 0x8a, 0x8e, 0x80
  db 0x71, 0x7b, 0x7c, 0x7c, 0x8c, 0x8f, 0x7e, 0x72
  db 0x7a, 0x7f, 0x79, 0x88, 0x92, 0x86, 0x7c, 0x89
  db 0x88, 0x73, 0x73, 0x86, 0x83, 0x75, 0x86, 0x8a
  db 0x77, 0x74, 0x83, 0x83, 0x74, 0x81, 0x8d, 0x82
  db 0x85, 0x8b, 0x83, 0x71, 0x70, 0x84, 0x7d, 0x80
  db 0x8d, 0x87, 0x76, 0x73, 0x80, 0x7c, 0x7e, 0x8e
  db 0x8d, 0x7c, 0x7a, 0x8d, 0x85, 0x73, 0x78, 0x8a
  db 0x7f, 0x77, 0x87, 0x8a, 0x78, 0x7a, 0x85, 0x7d
  db 0x72, 0x85, 0x8d, 0x7c, 0x84, 0x8e, 0x87, 0x76
  db 0x71, 0x7f, 0x7e, 0x79, 0x8a, 0x90, 0x80, 0x75
  db 0x80, 0x7d, 0x75, 0x83, 0x8f, 0x84, 0x86, 0x89
  db 0x86, 0x7a, 0x6f, 0x7d, 0x80, 0x78, 0x81, 0x8b
  db 0x80, 0x78, 0x7f, 0x80, 0x7a, 0x81, 0x86, 0x82
  db 0x83, 0x86, 0x8a, 0x83, 0x76, 0x7e, 0x80, 0x7b
  db 0x77, 0x81, 0x82, 0x7c, 0x7f, 0x81, 0x7f, 0x82
  db 0x83, 0x83, 0x82, 0x83, 0x86, 0x87, 0x82, 0x7a
  db 0x7f, 0x81, 0x7f, 0x78, 0x7d, 0x7e, 0x7c, 0x7d
  db 0x81, 0x80, 0x7f, 0x83, 0x83, 0x83, 0x85, 0x85
  db 0x85, 0x85, 0x7e, 0x7e, 0x80, 0x80, 0x7c, 0x7a
  db 0x7c, 0x7c, 0x7d, 0x7e, 0x7f, 0x7f, 0x81, 0x81
  db 0x84, 0x84, 0x84, 0x85, 0x85, 0x85, 0x83, 0x81
  db 0x81, 0x7f, 0x7f, 0x7b, 0x7a, 0x7b, 0x7d, 0x7d
  db 0x7d, 0x7e, 0x7e, 0x7f, 0x82, 0x83, 0x83, 0x83
  db 0x82, 0x84, 0x85, 0x85, 0x82, 0x80, 0x7f, 0x7f
  db 0x7e, 0x7c, 0x7a, 0x7b, 0x7c, 0x7b, 0x7d, 0x7f
  db 0x7e, 0x7e, 0x81, 0x83, 0x83, 0x84, 0x85, 0x84
  db 0x83, 0x84, 0x85, 0x84, 0x80, 0x7f, 0x7f, 0x7d
  db 0x7b, 0x7b, 0x7c, 0x7b, 0x7c, 0x7e, 0x80, 0x7f
  db 0x80, 0x82, 0x82, 0x82, 0x84, 0x85, 0x82, 0x84
  db 0x85, 0x83, 0x81, 0x81, 0x80, 0x7e, 0x7f, 0x7e
  db 0x7c, 0x7b, 0x7e, 0x7d, 0x7c, 0x7d, 0x80, 0x7f
  db 0x7f, 0x82, 0x83, 0x82, 0x83, 0x83, 0x82, 0x82
  db 0x82, 0x82, 0x81, 0x81, 0x81, 0x81, 0x7f, 0x7e
  db 0x7f, 0x7e, 0x7d, 0x7e, 0x7d, 0x7d, 0x7d, 0x7e
  db 0x7e, 0x80, 0x80, 0x82, 0x82, 0x82, 0x83, 0x83
  db 0x83, 0x83, 0x83, 0x81, 0x81, 0x81, 0x81, 0x81
  db 0x80, 0x7f, 0x7f, 0x7e, 0x7d, 0x7e, 0x7d, 0x7c
  db 0x7c, 0x7e, 0x7e, 0x7f, 0x80, 0x81, 0x80, 0x82
  db 0x83, 0x84, 0x84, 0x83, 0x82, 0x81, 0x82, 0x82
  db 0x81, 0x80, 0x7f, 0x7f, 0x7f, 0x80, 0x7f, 0x7e
  db 0x7d, 0x7e, 0x7d, 0x7e, 0x7e, 0x7f, 0x7f, 0x7e
  db 0x80, 0x82, 0x82, 0x82, 0x82, 0x82, 0x83, 0x83
  db 0x84, 0x81, 0x81, 0x80, 0x7f, 0x7f, 0x80, 0x80
  db 0x7f, 0x7e, 0x7f, 0x80, 0x7e, 0x7e, 0x7f, 0x7e
  db 0x7c, 0x7d, 0x7f, 0x7e, 0x7f, 0x7f, 0x80, 0x82
  db 0x83, 0x84, 0x83, 0x83, 0x83, 0x82, 0x82, 0x82
  db 0x81, 0x81, 0x80, 0x7f, 0x7f, 0x7f, 0x80, 0x80
  db 0x7f, 0x7f, 0x7e, 0x7e, 0x7e, 0x7e, 0x7e, 0x7d
  db 0x7d, 0x7e, 0x7f, 0x81, 0x81, 0x82, 0x83, 0x83
  db 0x85, 0x84, 0x83, 0x82, 0x81, 0x80, 0x7f, 0x80
  db 0x7e, 0x7e, 0x7e, 0x7f, 0x81, 0x80, 0x81, 0x81
  db 0x80, 0x7f, 0x7f, 0x7e, 0x7c, 0x7d, 0x7e, 0x7d
  db 0x7d, 0x7e, 0x81, 0x82, 0x84, 0x84, 0x83, 0x81
  db 0x82, 0x83, 0x82, 0x82, 0x81, 0x81, 0x81, 0x80
  db 0x83, 0x83, 0x82, 0x82, 0x7e, 0x7d, 0x7d, 0x7c
  db 0x79, 0x78, 0x7d, 0x7f, 0x7f, 0x80, 0x82, 0x84
  db 0x86, 0x86, 0x87, 0x85, 0x82, 0x82, 0x7f, 0x7e
  db 0x7e, 0x7d, 0x7c, 0x7c, 0x80, 0x84, 0x8a, 0x89
  db 0x82, 0x7f, 0x7b, 0x76, 0x70, 0x6d, 0x6f, 0x76
  db 0x7a, 0x7f, 0x82, 0x84, 0x85, 0x89, 0x8c, 0x89
  db 0x8a, 0x87, 0x86, 0x85, 0x86, 0x88, 0x89, 0x87
  db 0x8b, 0x91, 0x87, 0x81, 0x80, 0x7d, 0x77, 0x75
  db 0x78, 0x76, 0x76, 0x76, 0x79, 0x7c, 0x7e, 0x81
  db 0x80, 0x79, 0x7a, 0x77, 0x76, 0x77, 0x80, 0x8c
  db 0x90, 0x92, 0x8d, 0x87, 0x83, 0x81, 0x7e, 0x7c
  db 0x7a, 0x7a, 0x77, 0x6e, 0x6e, 0x74, 0x75, 0x75
  db 0x7b, 0x78, 0x75, 0x81, 0x84, 0x83, 0x86, 0x8e
  db 0x90, 0x96, 0x9d, 0x97, 0x90, 0x85, 0x88, 0x86
  db 0x81, 0x7f, 0x7d, 0x7c, 0x78, 0x77, 0x78, 0x6b
  db 0x6b, 0x6f, 0x6a, 0x71, 0x81, 0x86, 0x7e, 0x8d
  db 0x97, 0x96, 0x94, 0x8e, 0x75, 0x6b, 0x81, 0x85
  db 0x84, 0x92, 0x8f, 0x86, 0x75, 0x7a, 0x7e, 0x6f
  db 0x71, 0x79, 0x7f, 0x87, 0x8f, 0x8c, 0x83, 0x7f
  db 0x89, 0x8b, 0x86, 0x71, 0x65, 0x6e, 0x73, 0x79
  db 0x93, 0x9a, 0x8e, 0x7a, 0x75, 0x7f, 0x76, 0x78
  db 0x81, 0x7e, 0x80, 0x8c, 0x8c, 0x87, 0x8a, 0x8a
  db 0x86, 0x83, 0x72, 0x62, 0x6c, 0x71, 0x78, 0x8f
  db 0x94, 0x87, 0x72, 0x71, 0x79, 0x79, 0x7c, 0x81
  db 0x96, 0x96, 0x8d, 0x89, 0x8b, 0x88, 0x83, 0x83
  db 0x71, 0x62, 0x6a, 0x73, 0x7b, 0x8c, 0x98, 0x8c
  db 0x72, 0x6f, 0x77, 0x7e, 0x7d, 0x84, 0x92, 0x92
  db 0x84, 0x80, 0x80, 0x82, 0x88, 0x8b, 0x82, 0x6b
  db 0x6b, 0x7a, 0x7b, 0x7c, 0x91, 0x92, 0x7f, 0x6f
  db 0x75, 0x86, 0x80, 0x88, 0x82, 0x78, 0x79, 0x89
  db 0x94, 0x90, 0x89, 0x86, 0x7e, 0x69, 0x65, 0x77
  db 0x8b, 0x85, 0x8e, 0x88, 0x73, 0x6b, 0x77, 0x91
  db 0x82, 0x7f, 0x8f, 0x81, 0x6e, 0x7c, 0x90, 0x86
  db 0x84, 0x8f, 0x7e, 0x6b, 0x6b, 0x82, 0x8f, 0x7e
  db 0x8d, 0x8c, 0x72, 0x6b, 0x7f, 0x93, 0x87, 0x7c
  db 0x78, 0x75, 0x78, 0x8f, 0x95, 0x89, 0x82, 0x8a
  db 0x81, 0x6d, 0x6c, 0x81, 0x8e, 0x79, 0x89, 0x8e
  db 0x78, 0x6d, 0x79, 0x8f, 0x8a, 0x73, 0x74, 0x78
  db 0x7b, 0x90, 0x95, 0x8e, 0x89, 0x89, 0x71, 0x69
  db 0x74, 0x8c, 0x8d, 0x84, 0x89, 0x73, 0x6a, 0x72
  db 0x89, 0x90, 0x78, 0x78, 0x84, 0x76, 0x7d, 0x91
  db 0x90, 0x8a, 0x87, 0x7a, 0x6b, 0x71, 0x80, 0x93
  db 0x86, 0x83, 0x7b, 0x6f, 0x73, 0x83, 0x93, 0x86
  db 0x73, 0x74, 0x7f, 0x87, 0x8d, 0x92, 0x8a, 0x86
  db 0x83, 0x6f, 0x6c, 0x77, 0x8f, 0x86, 0x7f, 0x84
  db 0x79, 0x71, 0x77, 0x8c, 0x8e, 0x78, 0x71, 0x79
  db 0x7e, 0x8f, 0x91, 0x8b, 0x89, 0x83, 0x6e, 0x6b
  db 0x78, 0x8f, 0x89, 0x87, 0x84, 0x6d, 0x70, 0x79
  db 0x90, 0x8b, 0x76, 0x74, 0x79, 0x7f, 0x8a, 0x95
  db 0x8b, 0x8b, 0x7b, 0x6d, 0x70, 0x83, 0x91, 0x8a
  db 0x81, 0x70, 0x74, 0x75, 0x86, 0x93, 0x89, 0x77
  db 0x73, 0x7a, 0x88, 0x8d, 0x8c, 0x85, 0x84, 0x86
  db 0x6c, 0x6c, 0x79, 0x8c, 0x82, 0x7d, 0x83, 0x76
  db 0x71, 0x7e, 0x91, 0x8d, 0x78, 0x74, 0x78, 0x85
  db 0x8f, 0x8f, 0x8a, 0x88, 0x7f, 0x6c, 0x6d, 0x7c
  db 0x90, 0x82, 0x84, 0x80, 0x70, 0x72, 0x7d, 0x94
  db 0x85, 0x73, 0x74, 0x7c, 0x89, 0x91, 0x8e, 0x89
  db 0x87, 0x72, 0x6d, 0x77, 0x8e, 0x8d, 0x85, 0x81
  db 0x6f, 0x6f, 0x78, 0x8e, 0x8d, 0x77, 0x74, 0x7a
  db 0x82, 0x8c, 0x8f, 0x8b, 0x7e, 0x86, 0x7a, 0x6d
  db 0x74, 0x8a, 0x8e, 0x78, 0x78, 0x7c, 0x78, 0x7c
  db 0x8e, 0x93, 0x7b, 0x73, 0x7a, 0x86, 0x93, 0x8a
  db 0x89, 0x7c, 0x83, 0x7e, 0x6d, 0x6c, 0x7f, 0x8d
  db 0x7c, 0x7d, 0x7e, 0x7a, 0x74, 0x84, 0x92, 0x84
  db 0x73, 0x77, 0x7c, 0x8c, 0x8f, 0x8e, 0x87, 0x87
  db 0x7a, 0x6a, 0x72, 0x82, 0x8f, 0x7f, 0x86, 0x79
  db 0x71, 0x74, 0x83, 0x93, 0x7e, 0x74, 0x79, 0x7e
  db 0x8a, 0x8f, 0x8f, 0x85, 0x83, 0x7e, 0x6d, 0x72
  db 0x84, 0x8f, 0x81, 0x70, 0x76, 0x79, 0x79, 0x89
  db 0x95, 0x84, 0x76, 0x76, 0x80, 0x92, 0x8d, 0x86
  db 0x7d, 0x78, 0x87, 0x84, 0x70, 0x6e, 0x7e, 0x89
  db 0x7b, 0x80, 0x89, 0x7d, 0x74, 0x7c, 0x90, 0x86
  db 0x75, 0x76, 0x7b, 0x87, 0x90, 0x8d, 0x88, 0x83
  db 0x88, 0x79, 0x6c, 0x72, 0x85, 0x88, 0x7a, 0x80
  db 0x7e, 0x74, 0x73, 0x87, 0x91, 0x7d, 0x73, 0x79
  db 0x81, 0x8b, 0x8e, 0x8d, 0x87, 0x88, 0x7c, 0x6a
  db 0x6f, 0x80, 0x8f, 0x7e, 0x7b, 0x7b, 0x75, 0x77
  db 0x86, 0x97, 0x83, 0x74, 0x77, 0x82, 0x8f, 0x90
  db 0x8a, 0x7c, 0x71, 0x84, 0x8b, 0x78, 0x71, 0x7f
  db 0x8b, 0x7b, 0x7b, 0x8c, 0x82, 0x73, 0x7a, 0x8e
  db 0x88, 0x75, 0x76, 0x7b, 0x81, 0x8e, 0x90, 0x84
  db 0x7b, 0x83, 0x8c, 0x80, 0x6f, 0x71, 0x87, 0x87
  db 0x7b, 0x84, 0x83, 0x72, 0x70, 0x83, 0x91, 0x80
  db 0x74, 0x78, 0x7a, 0x85, 0x90, 0x8e, 0x86, 0x85
  db 0x88, 0x79, 0x6b, 0x73, 0x88, 0x8a, 0x7a, 0x80
  db 0x7c, 0x73, 0x77, 0x8d, 0x93, 0x7c, 0x75, 0x7a
  db 0x86, 0x8d, 0x8c, 0x8b, 0x79, 0x70, 0x88, 0x8c
  db 0x75, 0x71, 0x82, 0x8a, 0x75, 0x7d, 0x8f, 0x81
  db 0x72, 0x7c, 0x90, 0x87, 0x76, 0x78, 0x7b, 0x80
  db 0x8c, 0x90, 0x83, 0x74, 0x80, 0x8d, 0x89, 0x75
  db 0x70, 0x7d, 0x88, 0x7e, 0x85, 0x8a, 0x78, 0x6e
  db 0x7a, 0x8e, 0x8a, 0x78, 0x73, 0x77, 0x7b, 0x8c
  db 0x92, 0x87, 0x7c, 0x84, 0x8c, 0x7b, 0x6e, 0x73
  db 0x87, 0x86, 0x78, 0x86, 0x82, 0x74, 0x74, 0x88
  db 0x91, 0x7c, 0x72, 0x78, 0x80, 0x8b, 0x8e, 0x8c
  db 0x7d, 0x77, 0x83, 0x8c, 0x7f, 0x6f, 0x76, 0x85
  db 0x82, 0x7c, 0x8b, 0x82, 0x73, 0x76, 0x8a, 0x8e
  db 0x7e, 0x75, 0x76, 0x7b, 0x8a, 0x91, 0x8a, 0x7a
  db 0x77, 0x85, 0x8c, 0x84, 0x73, 0x72, 0x7e, 0x85
  db 0x83, 0x8e, 0x84, 0x71, 0x71, 0x80, 0x8f, 0x86
  db 0x76, 0x74, 0x77, 0x84, 0x92, 0x8c, 0x81, 0x7e
  db 0x86, 0x86, 0x76, 0x6c, 0x75, 0x89, 0x82, 0x7f
  db 0x89, 0x7a, 0x73, 0x7a, 0x90, 0x8a, 0x78, 0x74
  db 0x7d, 0x89, 0x8e, 0x8c, 0x87, 0x75, 0x78, 0x8b
  db 0x86, 0x72, 0x6f, 0x81, 0x88, 0x78, 0x84, 0x8c
  db 0x79, 0x73, 0x83, 0x91, 0x83, 0x75, 0x78, 0x79
  db 0x82, 0x91, 0x8f, 0x7d, 0x73, 0x83, 0x8d, 0x8b
  db 0x79, 0x6f, 0x77, 0x84, 0x86, 0x89, 0x89, 0x75
  db 0x71, 0x7a, 0x8c, 0x8c, 0x7c, 0x71, 0x75, 0x7c
  db 0x8d, 0x90, 0x84, 0x79, 0x7e, 0x87, 0x89, 0x7a
  db 0x6c, 0x75, 0x85, 0x86, 0x83, 0x8a, 0x7b, 0x74
  db 0x77, 0x8d, 0x8d, 0x79, 0x74, 0x7a, 0x85, 0x8d
  db 0x8e, 0x86, 0x79, 0x74, 0x84, 0x8f, 0x86, 0x71
  db 0x72, 0x80, 0x86, 0x83, 0x8b, 0x84, 0x72, 0x73
  db 0x85, 0x8f, 0x83, 0x79, 0x73, 0x78, 0x81, 0x91
  db 0x8d, 0x7e, 0x71, 0x7e, 0x8b, 0x8c, 0x7f, 0x6f
  db 0x74, 0x80, 0x88, 0x8a, 0x8b, 0x7b, 0x70, 0x75
  db 0x86, 0x90, 0x81, 0x72, 0x74, 0x79, 0x8b, 0x91
  db 0x89, 0x7b, 0x78, 0x83, 0x89, 0x86, 0x71, 0x6f
  db 0x7a, 0x88, 0x82, 0x87, 0x87, 0x74, 0x74, 0x7f
  db 0x90, 0x87, 0x76, 0x76, 0x7c, 0x86, 0x90, 0x8d
  db 0x7f, 0x73, 0x7c, 0x8a, 0x8c, 0x79, 0x70, 0x79
  db 0x86, 0x84, 0x86, 0x8b, 0x79, 0x6f, 0x7a, 0x8d
  db 0x8a, 0x7f, 0x76, 0x75, 0x77, 0x88, 0x91, 0x85
  db 0x78, 0x77, 0x83, 0x8b, 0x8b, 0x79, 0x6e, 0x76
  db 0x87, 0x88, 0x89, 0x87, 0x76, 0x70, 0x7a, 0x8c
  db 0x8c, 0x7a, 0x74, 0x79, 0x83, 0x8f, 0x8c, 0x84
  db 0x78, 0x78, 0x85, 0x8c, 0x78, 0x6d, 0x7c, 0x86
  db 0x81, 0x81, 0x8d, 0x7e, 0x71, 0x7a, 0x8e, 0x89
  db 0x7b, 0x78, 0x78, 0x7d, 0x8b, 0x91, 0x84, 0x75
  db 0x7a, 0x89, 0x8e, 0x80, 0x71, 0x75, 0x83, 0x87
  db 0x83, 0x8d, 0x7e, 0x71, 0x75, 0x89, 0x8e, 0x80
  db 0x74, 0x74, 0x79, 0x89, 0x91, 0x87, 0x7b, 0x7a
  db 0x85, 0x8a, 0x83, 0x70, 0x70, 0x7e, 0x86, 0x80
  db 0x8b, 0x82, 0x73, 0x73, 0x85, 0x91, 0x81, 0x76
  db 0x79, 0x7f, 0x88, 0x8f, 0x8a, 0x7c, 0x74, 0x82
  db 0x8c, 0x83, 0x70, 0x75, 0x84, 0x83, 0x7e, 0x8a
  db 0x85, 0x72, 0x74, 0x8b, 0x8e, 0x7e, 0x79, 0x77
  db 0x78, 0x85, 0x91, 0x88, 0x78, 0x76, 0x86, 0x8d
  db 0x86, 0x74, 0x71, 0x7b, 0x85, 0x84, 0x8c, 0x84
  db 0x75, 0x74, 0x81, 0x8f, 0x87, 0x77, 0x73, 0x79
  db 0x86, 0x8f, 0x87, 0x80, 0x7a, 0x81, 0x88, 0x85
  db 0x70, 0x71, 0x7d, 0x85, 0x80, 0x86, 0x85, 0x75
  db 0x75, 0x84, 0x90, 0x81, 0x75, 0x78, 0x80, 0x85
  db 0x8b, 0x89, 0x7e, 0x75, 0x81, 0x8f, 0x87, 0x73
  db 0x73, 0x80, 0x86, 0x80, 0x8b, 0x86, 0x73, 0x72
  db 0x83, 0x8f, 0x82, 0x7b, 0x74, 0x75, 0x81, 0x92
  db 0x8b, 0x7e, 0x78, 0x7d, 0x86, 0x8c, 0x7e, 0x6e
  db 0x73, 0x82, 0x86, 0x87, 0x8b, 0x7b, 0x70, 0x76
  db 0x8a, 0x8d, 0x7b, 0x72, 0x78, 0x81, 0x8e, 0x8e
  db 0x88, 0x7b, 0x79, 0x84, 0x8a, 0x79, 0x6c, 0x79
  db 0x86, 0x83, 0x7f, 0x8b, 0x7e, 0x72, 0x7b, 0x8d
  db 0x89, 0x7a, 0x77, 0x7c, 0x81, 0x8b, 0x8d, 0x82
  db 0x77, 0x7c, 0x89, 0x8c, 0x7c, 0x6f, 0x76, 0x85
  db 0x84, 0x85, 0x8d, 0x7d, 0x72, 0x77, 0x8a, 0x8d
  db 0x7e, 0x72, 0x75, 0x7c, 0x8b, 0x91, 0x86, 0x7c
  db 0x7b, 0x84, 0x8a, 0x7b, 0x6e, 0x73, 0x81, 0x84
  db 0x82, 0x8d, 0x7c, 0x73, 0x77, 0x8b, 0x8c, 0x77
  db 0x77, 0x7d, 0x84, 0x8a, 0x8f, 0x86, 0x79, 0x7c
  db 0x89, 0x87, 0x72, 0x70, 0x80, 0x85, 0x7b, 0x83
  db 0x8a, 0x78, 0x73, 0x82, 0x8f, 0x82, 0x79, 0x77
  db 0x79, 0x83, 0x8e, 0x8c, 0x7c, 0x77, 0x84, 0x8d
  db 0x85, 0x73, 0x70, 0x7d, 0x87, 0x82, 0x8c, 0x86
  db 0x72, 0x71, 0x82, 0x92, 0x84, 0x74, 0x74, 0x7a
  db 0x86, 0x91, 0x8a, 0x80, 0x7f, 0x84, 0x87, 0x77
  db 0x6b, 0x7a, 0x88, 0x82, 0x7f, 0x8b, 0x78, 0x6f
  db 0x7e, 0x91, 0x87, 0x73, 0x77, 0x81, 0x88, 0x8b
  db 0x8e, 0x7f, 0x73, 0x7e, 0x8f, 0x86, 0x73, 0x72
  db 0x82, 0x84, 0x7d, 0x8d, 0x87, 0x72, 0x72, 0x87
  db 0x8c, 0x80, 0x77, 0x76, 0x78, 0x88, 0x91, 0x89
  db 0x77, 0x79, 0x89, 0x8c, 0x7c, 0x6f, 0x75, 0x83
  db 0x82, 0x84, 0x8e, 0x7d, 0x72, 0x79, 0x8b, 0x8a
  db 0x7b, 0x75, 0x78, 0x80, 0x8d, 0x91, 0x85, 0x7d
  db 0x7f, 0x87, 0x81, 0x6e, 0x72, 0x81, 0x82, 0x7c
  db 0x85, 0x84, 0x74, 0x75, 0x87, 0x8d, 0x7f, 0x76
  db 0x7a, 0x80, 0x8a, 0x8d, 0x88, 0x7a, 0x7a, 0x84
  db 0x8d, 0x80, 0x71, 0x75, 0x84, 0x85, 0x81, 0x8e
  db 0x81, 0x71, 0x77, 0x8a, 0x8c, 0x7e, 0x76, 0x74
  db 0x7b, 0x8b, 0x92, 0x86, 0x7b, 0x7d, 0x85, 0x89
  db 0x7a, 0x6d, 0x76, 0x84, 0x81, 0x84, 0x8c, 0x7c
  db 0x71, 0x79, 0x8c, 0x89, 0x79, 0x76, 0x7b, 0x84
  db 0x8d, 0x8f, 0x85, 0x7a, 0x7d, 0x87, 0x86, 0x72
  db 0x6f, 0x81, 0x84, 0x7c, 0x85, 0x89, 0x76, 0x70
  db 0x83, 0x90, 0x81, 0x7b, 0x7a, 0x78, 0x82, 0x8f
  db 0x8b, 0x7a, 0x78, 0x83, 0x8d, 0x8a, 0x75, 0x6e
  db 0x7a, 0x87, 0x81, 0x89, 0x89, 0x76, 0x6f, 0x81
  db 0x8f, 0x87, 0x7a, 0x72, 0x76, 0x81, 0x90, 0x8c
  db 0x81, 0x7b, 0x80, 0x88, 0x86, 0x71, 0x6f, 0x7e
  db 0x89, 0x7e, 0x87, 0x87, 0x73, 0x74, 0x84, 0x90
  db 0x80, 0x74, 0x77, 0x83, 0x88, 0x8e, 0x8b, 0x7e
  db 0x76, 0x80, 0x8d, 0x86, 0x70, 0x71, 0x81, 0x83
  db 0x80, 0x8b, 0x86, 0x73, 0x74, 0x85, 0x8e, 0x7f
  db 0x7f, 0x78, 0x74, 0x83, 0x92, 0x8a, 0x78, 0x7a
  db 0x84, 0x8b, 0x89, 0x77, 0x6f, 0x77, 0x85, 0x86
  db 0x8a, 0x88, 0x76, 0x71, 0x7c, 0x8d, 0x8a, 0x7c
  db 0x72, 0x78, 0x82, 0x91, 0x8c, 0x83, 0x7c, 0x7d
  db 0x85, 0x8a, 0x76, 0x6c, 0x7c, 0x85, 0x80, 0x83
  db 0x89, 0x78, 0x72, 0x82, 0x8f, 0x85, 0x7c, 0x7a
  db 0x7a, 0x82, 0x8b, 0x8b, 0x80, 0x78, 0x7d, 0x8a
  db 0x8e, 0x78, 0x6e, 0x79, 0x88, 0x80, 0x86, 0x8d
  db 0x78, 0x70, 0x7d, 0x8f, 0x86, 0x7e, 0x76, 0x72
  db 0x7d, 0x8f, 0x8e, 0x80, 0x7a, 0x7d, 0x85, 0x8c
  db 0x7b, 0x6f, 0x74, 0x82, 0x82, 0x84, 0x8e, 0x7b
  db 0x72, 0x78, 0x8b, 0x8b, 0x7e, 0x74, 0x78, 0x83
  db 0x8d, 0x8d, 0x88, 0x7d, 0x78, 0x82, 0x8b, 0x7b
  db 0x6c, 0x7a, 0x85, 0x7f, 0x81, 0x8d, 0x7d, 0x71
  db 0x7b, 0x8d, 0x86, 0x7f, 0x7c, 0x76, 0x7d, 0x8b
  db 0x8e, 0x82, 0x79, 0x7e, 0x87, 0x8d, 0x7d, 0x6e
  db 0x73, 0x82, 0x86, 0x86, 0x8b, 0x7d, 0x71, 0x75
  db 0x8b, 0x8d, 0x81, 0x74, 0x75, 0x7e, 0x8d, 0x8f
  db 0x85, 0x7f, 0x7d, 0x82, 0x88, 0x78, 0x6a, 0x77
  db 0x84, 0x85, 0x82, 0x8a, 0x7c, 0x71, 0x7c, 0x8d
  db 0x88, 0x79, 0x75, 0x7d, 0x84, 0x89, 0x8c, 0x84
  db 0x78, 0x7c, 0x8a, 0x8a, 0x78, 0x6e, 0x7e, 0x85
  db 0x80, 0x87, 0x8c, 0x78, 0x71, 0x80, 0x8e, 0x83
  db 0x7d, 0x78, 0x73, 0x80, 0x8f, 0x8d, 0x7f, 0x7a
  db 0x80, 0x8a, 0x89, 0x77, 0x6e, 0x77, 0x85, 0x83
  db 0x8b, 0x8b, 0x79, 0x72, 0x7f, 0x8b, 0x86, 0x7c
  db 0x76, 0x78, 0x83, 0x8e, 0x8b, 0x84, 0x7d, 0x7e
  db 0x87, 0x86, 0x70, 0x6f, 0x80, 0x83, 0x7f, 0x84
  db 0x86, 0x76, 0x75, 0x87, 0x8d, 0x81, 0x7a, 0x79
  db 0x7b, 0x84, 0x8d, 0x88, 0x7e, 0x7a, 0x80, 0x8c
  db 0x89, 0x73, 0x6e, 0x7c, 0x88, 0x81, 0x8a, 0x87
  db 0x73, 0x71, 0x81, 0x8e, 0x85, 0x7c, 0x74, 0x77
  db 0x83, 0x90, 0x8c, 0x80, 0x7d, 0x7f, 0x87, 0x87
  db 0x73, 0x6e, 0x79, 0x87, 0x80, 0x87, 0x88, 0x74
  db 0x73, 0x80, 0x91, 0x84, 0x76, 0x78, 0x7f, 0x87
  db 0x8e, 0x8d, 0x81, 0x78, 0x80, 0x8a, 0x85, 0x6f
  db 0x72, 0x80, 0x83, 0x7e, 0x8a, 0x85, 0x72, 0x74
  db 0x87, 0x8d, 0x80, 0x7b, 0x78, 0x78, 0x87, 0x90
  db 0x88, 0x7c, 0x7a, 0x83, 0x8c, 0x86, 0x72, 0x6e
  db 0x7d, 0x86, 0x82, 0x8d, 0x86, 0x73, 0x73, 0x83
  db 0x8e, 0x85, 0x78, 0x74, 0x78, 0x87, 0x90, 0x8a
  db 0x80, 0x7d, 0x83, 0x89, 0x7f, 0x6d, 0x71, 0x81
  db 0x85, 0x7f, 0x8a, 0x80, 0x70, 0x76, 0x88, 0x8f
  db 0x7c, 0x77, 0x7d, 0x84, 0x89, 0x8f, 0x89, 0x79
  db 0x78, 0x85, 0x8c, 0x7f, 0x6e, 0x76, 0x82, 0x81
  db 0x82, 0x8e, 0x7f, 0x6f, 0x77, 0x8b, 0x8a, 0x7f
  db 0x7b, 0x74, 0x7c, 0x8d, 0x90, 0x83, 0x7a, 0x7f
  db 0x87, 0x8c, 0x7c, 0x6c, 0x72, 0x81, 0x83, 0x87
  db 0x8e, 0x7d, 0x6f, 0x78, 0x8b, 0x8c, 0x7f, 0x75
  db 0x76, 0x80, 0x8d, 0x90, 0x86, 0x7f, 0x7d, 0x86
  db 0x88, 0x71, 0x6e, 0x7d, 0x84, 0x7f, 0x82, 0x88
  db 0x76, 0x72, 0x83, 0x8f, 0x82, 0x79, 0x79, 0x7c
  db 0x86, 0x8d, 0x8b, 0x7f, 0x7a, 0x7f, 0x8c, 0x87
  db 0x72, 0x70, 0x7d, 0x84, 0x7f, 0x8c, 0x8a, 0x75
  db 0x70, 0x82, 0x8e, 0x83, 0x7e, 0x76, 0x75, 0x83
  db 0x91, 0x8b, 0x7f, 0x7e, 0x7f, 0x88, 0x83, 0x70
  db 0x6f, 0x7e, 0x84, 0x7e, 0x8b, 0x86, 0x74, 0x72
  db 0x85, 0x8e, 0x82, 0x78, 0x76, 0x7f, 0x8a, 0x8d
  db 0x89, 0x82, 0x7e, 0x82, 0x8b, 0x7c, 0x6a, 0x79
  db 0x84, 0x81, 0x7e, 0x8a, 0x7f, 0x70, 0x7b, 0x8c
  db 0x87, 0x7b, 0x7b, 0x77, 0x7e, 0x8c, 0x8f, 0x83
  db 0x79, 0x7c, 0x84, 0x8d, 0x7d, 0x6d, 0x73, 0x82
  db 0x83, 0x84, 0x8f, 0x7e, 0x72, 0x78, 0x88, 0x88
  db 0x82, 0x7a, 0x75, 0x7d, 0x8b, 0x90, 0x85, 0x7f
  db 0x7f, 0x84, 0x88, 0x76, 0x6a, 0x75, 0x85, 0x82
  db 0x81, 0x8b, 0x7b, 0x71, 0x7a, 0x8d, 0x88, 0x7b
  db 0x78, 0x7c, 0x84, 0x8d, 0x8f, 0x85, 0x7a, 0x7b
  db 0x87, 0x8b, 0x76, 0x6c, 0x7b, 0x83, 0x7f, 0x84
  db 0x8c, 0x7a, 0x70, 0x7f, 0x8d, 0x85, 0x7f, 0x7b
  db 0x75, 0x7e, 0x8f, 0x8e, 0x7e, 0x7b, 0x80, 0x89
  db 0x8b, 0x78, 0x6d, 0x76, 0x84, 0x83, 0x88, 0x8b
  db 0x79, 0x70, 0x7b, 0x8d, 0x87, 0x7c, 0x75, 0x76
  db 0x80, 0x8f, 0x8e, 0x84, 0x7f, 0x7f, 0x87, 0x86
  db 0x70, 0x6e, 0x7d, 0x84, 0x80, 0x84, 0x87, 0x75
  db 0x73, 0x85, 0x8e, 0x83, 0x77, 0x7a, 0x80, 0x87
  db 0x8b, 0x8a, 0x7f, 0x78, 0x7f, 0x8d, 0x88, 0x70
  db 0x71, 0x7f, 0x83, 0x7f, 0x8c, 0x88, 0x72, 0x72
  db 0x85, 0x8c, 0x82, 0x7e, 0x76, 0x77, 0x85, 0x91
  db 0x88, 0x7f, 0x7d, 0x80, 0x89, 0x84, 0x71, 0x6d
  db 0x7b, 0x84, 0x81, 0x8c, 0x88, 0x74, 0x71, 0x84
  db 0x8e, 0x7f, 0x79, 0x7b, 0x7f, 0x86, 0x8c, 0x8b
  db 0x82, 0x7b, 0x82, 0x8a, 0x7f, 0x6b, 0x74, 0x82
  db 0x7f, 0x7e, 0x8b, 0x82, 0x70, 0x78, 0x8a, 0x89
  db 0x7c, 0x7a, 0x7d, 0x80, 0x88, 0x8b, 0x84, 0x7b
  db 0x7c, 0x85, 0x8e, 0x7f, 0x6e, 0x73, 0x82, 0x83
  db 0x84, 0x90, 0x80, 0x70, 0x76, 0x8a, 0x89, 0x7c
  db 0x79, 0x79, 0x7e, 0x8a, 0x8e, 0x87, 0x82, 0x7f
  db 0x83, 0x88, 0x79, 0x6a, 0x75, 0x83, 0x83, 0x81
  db 0x8d, 0x7b, 0x70, 0x79, 0x8c, 0x88, 0x76, 0x7c
  db 0x83, 0x83, 0x86, 0x8d, 0x85, 0x79, 0x7f, 0x89
  db 0x88, 0x76, 0x6d, 0x7d, 0x81, 0x7f, 0x87, 0x8c
  db 0x77, 0x70, 0x80, 0x8c, 0x84, 0x7c, 0x7a, 0x7c
  db 0x85, 0x8b, 0x88, 0x80, 0x7d, 0x81, 0x8b, 0x87
  db 0x72, 0x6c, 0x79, 0x85, 0x80, 0x8c, 0x88, 0x73
  db 0x71, 0x7f, 0x8d, 0x80, 0x7a, 0x7d, 0x7c, 0x82
  db 0x8e, 0x8c, 0x80, 0x81, 0x84, 0x89, 0x7c, 0x67
  db 0x75, 0x82, 0x81, 0x81, 0x8b, 0x80, 0x70, 0x7a
  db 0x8a, 0x8a, 0x7a, 0x7a, 0x80, 0x82, 0x88, 0x8c
  db 0x85, 0x7b, 0x7d, 0x88, 0x8c, 0x77, 0x6b, 0x78
  db 0x84, 0x7f, 0x86, 0x8f, 0x7d, 0x6f, 0x7a, 0x8b
  db 0x84, 0x79, 0x7d, 0x7d, 0x82, 0x8b, 0x8c, 0x81
  db 0x80, 0x84, 0x87, 0x83, 0x6e, 0x6b, 0x7a, 0x85
  db 0x7e, 0x8b, 0x87, 0x71, 0x71, 0x82, 0x8d, 0x78
  db 0x7b, 0x86, 0x80, 0x81, 0x8e, 0x8c, 0x7e, 0x81
  db 0x88, 0x88, 0x72, 0x6c, 0x7d, 0x81, 0x7e, 0x88
  db 0x8c, 0x75, 0x70, 0x80, 0x8b, 0x80, 0x79, 0x7f
  db 0x7e, 0x83, 0x8b, 0x8b, 0x7d, 0x7f, 0x87, 0x8c
  db 0x82, 0x6c, 0x6f, 0x7f, 0x81, 0x84, 0x8f, 0x83
  db 0x70, 0x74, 0x86, 0x86, 0x78, 0x81, 0x82, 0x7e
  db 0x85, 0x8f, 0x85, 0x81, 0x87, 0x88, 0x83, 0x6b
  db 0x6f, 0x7e, 0x7f, 0x7f, 0x8d, 0x85, 0x6e, 0x74
  db 0x84, 0x8a, 0x79, 0x7e, 0x83, 0x7f, 0x84, 0x8e
  db 0x8a, 0x7f, 0x83, 0x85, 0x89, 0x78, 0x6c, 0x75
  db 0x80, 0x81, 0x85, 0x8c, 0x78, 0x70, 0x7c, 0x89
  db 0x84, 0x7e, 0x7e, 0x7a, 0x81, 0x8d, 0x8c, 0x82
  db 0x80, 0x80, 0x87, 0x8a, 0x7a, 0x6a, 0x75, 0x85
  db 0x80, 0x85, 0x8e, 0x79, 0x6d, 0x7b, 0x8c, 0x81
  db 0x77, 0x7e, 0x7f, 0x7e, 0x8a, 0x8e, 0x84, 0x82
  db 0x84, 0x85, 0x88, 0x78, 0x68, 0x74, 0x80, 0x80
  db 0x87, 0x8e, 0x7b, 0x6f, 0x7a, 0x88, 0x86, 0x7d
  db 0x7c, 0x7d, 0x81, 0x8a, 0x8c, 0x86, 0x81, 0x7f
  db 0x84, 0x8b, 0x82, 0x6b, 0x6d, 0x7e, 0x83, 0x83
  db 0x8e, 0x85, 0x70, 0x73, 0x82, 0x87, 0x7e, 0x80
  db 0x7f, 0x7d, 0x85, 0x8c, 0x88, 0x85, 0x84, 0x84
  db 0x86, 0x82, 0x6d, 0x6e, 0x81, 0x80, 0x7e, 0x85
  db 0x85, 0x76, 0x76, 0x84, 0x84, 0x7e, 0x7d, 0x7a
  db 0x82, 0x89, 0x8a, 0x84, 0x84, 0x84, 0x85, 0x88
  db 0x88, 0x7f, 0x6b, 0x6c, 0x79, 0x85, 0x85, 0x8c
  db 0x84, 0x70, 0x71, 0x7c, 0x82, 0x7e, 0x82, 0x84
  db 0x83, 0x83, 0x89, 0x8b, 0x8a, 0x88, 0x85, 0x82
  db 0x70, 0x6b, 0x76, 0x7c, 0x81, 0x87, 0x84, 0x79
  db 0x7a, 0x7e, 0x80, 0x83, 0x82, 0x7d, 0x7f, 0x86
  db 0x87, 0x86, 0x88, 0x84, 0x7e, 0x80, 0x86, 0x89
  db 0x84, 0x78, 0x6f, 0x72, 0x77, 0x7f, 0x84, 0x84
  db 0x80, 0x7d, 0x7f, 0x7e, 0x79, 0x7e, 0x86, 0x87
  db 0x87, 0x87, 0x88, 0x88, 0x89, 0x8a, 0x83, 0x82
  db 0x72, 0x69, 0x74, 0x7b, 0x80, 0x85, 0x82, 0x7c
  db 0x7c, 0x80, 0x7f, 0x7f, 0x85, 0x88, 0x86, 0x85
  db 0x85, 0x84, 0x83, 0x83, 0x81, 0x7f, 0x80, 0x81
  db 0x7a, 0x79, 0x7c, 0x7c, 0x79, 0x7c, 0x7f, 0x7f
  db 0x7f, 0x82, 0x81, 0x80, 0x7c, 0x7d, 0x83, 0x87
  db 0x87, 0x86, 0x85, 0x84, 0x84, 0x86, 0x85, 0x84
  db 0x83, 0x7d, 0x75, 0x73, 0x74, 0x77, 0x79, 0x7d
  db 0x7d, 0x7e, 0x80, 0x7c, 0x7c, 0x85, 0x89, 0x89
  db 0x89, 0x89, 0x88, 0x89, 0x89, 0x86, 0x83, 0x81
  db 0x7d, 0x76, 0x73, 0x74, 0x76, 0x77, 0x7b, 0x7d
  db 0x80, 0x7f, 0x81, 0x82, 0x82, 0x86, 0x87, 0x85
  db 0x86, 0x86, 0x84, 0x82, 0x83, 0x82, 0x81, 0x81
  db 0x81, 0x7c, 0x7c, 0x7f, 0x7c, 0x7b, 0x7b, 0x7a
  db 0x7a, 0x7d, 0x7f, 0x7f, 0x7e, 0x81, 0x84, 0x83
  db 0x85, 0x87, 0x86, 0x86, 0x85, 0x86, 0x88, 0x83
  db 0x83, 0x81, 0x81, 0x7e, 0x77, 0x77, 0x78, 0x75
  db 0x78, 0x79, 0x77, 0x7a, 0x7d, 0x82, 0x86, 0x85
  db 0x87, 0x88, 0x88, 0x89, 0x87, 0x84, 0x84, 0x81
  db 0x81, 0x7e, 0x7a, 0x7b, 0x7d, 0x7a, 0x77, 0x7a
  db 0x7c, 0x77, 0x7a, 0x7e, 0x7e, 0x82, 0x82, 0x83
  db 0x86, 0x88, 0x89, 0x8a, 0x8a, 0x8a, 0x84, 0x83
  db 0x82, 0x7f, 0x80, 0x7f, 0x7c, 0x7c, 0x80, 0x7f
  db 0x7a, 0x79, 0x7b, 0x7c, 0x7e, 0x7c, 0x7e, 0x7e
  db 0x80, 0x82, 0x83, 0x85, 0x84, 0x82, 0x86, 0x83
  db 0x81, 0x81, 0x7e, 0x7f, 0x7f, 0x81, 0x80, 0x7b
  db 0x7d, 0x7e, 0x7b, 0x7b, 0x78, 0x7b, 0x7c, 0x7a
  db 0x7f, 0x82, 0x81, 0x84, 0x84, 0x84, 0x84, 0x84
  db 0x84, 0x83, 0x81, 0x7e, 0x7e, 0x82, 0x7f, 0x7e
  db 0x80, 0x81, 0x81, 0x82, 0x81, 0x82, 0x83, 0x82
  db 0x80, 0x82, 0x83, 0x84, 0x82, 0x85, 0x84, 0x83
  db 0x83, 0x81, 0x80, 0x80, 0x7e, 0x7f, 0x7f, 0x7d
  db 0x7c, 0x7b, 0x7e, 0x80, 0x7a, 0x7b, 0x7d, 0x7f
  db 0x7d, 0x7c, 0x7d, 0x7b, 0x7a, 0x79, 0x7c, 0x7d
  db 0x7d, 0x7d, 0x7f, 0x80, 0x81, 0x83, 0x82, 0x83
  db 0x84, 0x86, 0x83, 0x85, 0x87, 0x86, 0x87, 0x88
  db 0x88, 0x86, 0x83, 0x81, 0x83, 0x82, 0x80, 0x7e
  db 0x81, 0x80, 0x7f, 0x81, 0x80, 0x80, 0x7f, 0x7f
  db 0x81, 0x82, 0x80, 0x7e, 0x7f, 0x7e, 0x7c, 0x7b
  db 0x7a, 0x78, 0x79, 0x78, 0x7a, 0x7c, 0x7c, 0x7c
  db 0x7d, 0x80, 0x7e, 0x80, 0x81, 0x82, 0x83, 0x85
  db 0x85, 0x86, 0x86, 0x84, 0x84, 0x83, 0x81, 0x80
  db 0x7f, 0x7e, 0x7e, 0x7e, 0x7e, 0x7e, 0x7f, 0x7e
  db 0x80, 0x81, 0x7f, 0x80, 0x81, 0x80, 0x82, 0x84
  db 0x84, 0x83, 0x82, 0x82, 0x80, 0x80, 0x80, 0x80
  db 0x80, 0x7f, 0x81, 0x80, 0x80, 0x80, 0x80, 0x80
  db 0x80, 0x80, 0x81, 0x80, 0x7f, 0x80, 0x7f, 0x80
  db 0x7e, 0x7f, 0x7f, 0x7f, 0x80, 0x80, 0x7f, 0x7f
  db 0x7f, 0x7f, 0x7e, 0x7e, 0x7e, 0x7f, 0x80, 0x81
  db 0x80, 0x82, 0x80, 0x7f, 0x80, 0x7d, 0x7d, 0x7c
  db 0x7c, 0x7d, 0x7d, 0x7f, 0x80, 0x80, 0x81, 0x81
  db 0x81, 0x81, 0x82, 0x82, 0x81, 0x82, 0x81, 0x80
  db 0x81, 0x82, 0x81, 0x81, 0x80, 0x80, 0x80, 0x80
  db 0x80, 0x80, 0x81, 0x81, 0x82, 0x81, 0x82, 0x83
  db 0x82, 0x80, 0x81, 0x81, 0x81, 0x80, 0x7e, 0x80
  db 0x7f, 0x7f, 0x80, 0x80, 0x7e, 0x7e, 0x7f, 0x7f
  db 0x80, 0x7f, 0x7f, 0x80, 0x80, 0x80, 0x80, 0x80
  db 0x7f, 0x80, 0x81, 0x80, 0x80, 0x81, 0x80, 0x80
  db 0x80, 0x81, 0x81, 0x80, 0x80, 0x80, 0x82, 0x82
  db 0x81, 0x80, 0x80, 0x80, 0x82, 0x81, 0x81, 0x80
  db 0x81, 0x81, 0x81, 0x82, 0x81, 0x80, 0x7f, 0x80
  db 0x80, 0x80, 0x80, 0x7f, 0x7f, 0x7f, 0x7e, 0x7f
  db 0x7e, 0x7e, 0x7f, 0x81, 0x80, 0x80, 0x7f, 0x80
  db 0x80, 0x80, 0x82, 0x80, 0x80, 0x7f, 0x80, 0x80
  db 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x80, 0x7f
  db 0x7f, 0x7f, 0x81, 0x80, 0x7f, 0x7f, 0x80, 0x80
  db 0x80, 0x81, 0x80, 0x80, 0x81, 0x82, 0x81, 0x82
  db 0x80, 0x80, 0x81, 0x81, 0x81, 0x81, 0x80, 0x80
  db 0x81, 0x80, 0x81, 0x7f, 0x80, 0x80, 0x80, 0x80
  db 0x80, 0x80, 0x7e, 0x7f, 0x80, 0x80, 0x80, 0x80
  db 0x7f, 0x7f, 0x80, 0x81, 0x81, 0x81, 0x80, 0x80
  db 0x80, 0x7f, 0x80, 0x7f, 0x7f, 0x7f, 0x81, 0x80
  db 0x7f, 0x7e, 0x7f, 0x80, 0x80, 0x80, 0x7f, 0x7f
  db 0x80, 0x80, 0x81, 0x80, 0x80, 0x80, 0x80, 0x80
  db 0x80, 0x81, 0x80, 0x80, 0x81, 0x82, 0x81, 0x81
  db 0x81, 0x80, 0x82, 0x82, 0x82, 0x81, 0x81, 0x80
  db 0x80, 0x80, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x80
  db 0x7f, 0x80, 0x7f, 0x80, 0x80, 0x80, 0x7f, 0x80
  db 0x80, 0x80, 0x81, 0x81, 0x81, 0x7e, 0x80, 0x80
  db 0x80, 0x7f, 0x80, 0x7f, 0x80, 0x80, 0x80, 0x80
  db 0x80, 0x7f, 0x81, 0x80, 0x80, 0x80, 0x80, 0x80
  db 0x80, 0x81, 0x81, 0x80, 0x80, 0x7f, 0x81, 0x80
  db 0x80, 0x80, 0x80, 0x7f, 0x80, 0x7f, 0x80, 0x80
  db 0x7f, 0x80, 0x81, 0x81, 0x80, 0x80, 0x80, 0x80
  db 0x81, 0x80, 0x80, 0x80, 0x80, 0x81, 0x81, 0x80
  db 0x81, 0x81, 0x80, 0x80, 0x80, 0x81, 0x7f, 0x80
  db 0x80, 0x80, 0x80, 0x7f, 0x80, 0x81, 0x81, 0x80
  db 0x7f, 0x80, 0x80, 0x80, 0x81, 0x81, 0x7f, 0x81
  db 0x80, 0x80, 0x80, 0x80, 0x81, 0x81, 0x80, 0x80
  db 0x80, 0x80, 0x80, 0x81, 0x80, 0x80, 0x80, 0x80
  db 0x80, 0x80, 0x80, 0x7f, 0x7f, 0x7f, 0x7f, 0x81
  db 0x80, 0x80, 0x80, 0x7f, 0x7f, 0x80, 0x80, 0x7f
  db 0x7f, 0x7f, 0x7f, 0x7f, 0x80, 0x80, 0x7f, 0x80
  db 0x80, 0x80, 0x80, 0x80, 0x7f, 0x80, 0x80, 0x80
  db 0x80, 0x81, 0x80, 0x80, 0x80, 0x80, 0x81, 0x80
  db 0x80, 0x80, 0x81, 0x80, 0x80, 0x7f, 0x80, 0x80
  db 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80
data_end:

