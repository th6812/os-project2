
obj/kern/kernel:     file format elf32-i386


Disassembly of section .text:

f0100000 <_start+0xeffffff4>:
f0100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
f0100006:	00 00                	add    %al,(%eax)
f0100008:	fe 4f 52             	decb   0x52(%edi)
f010000b:	e4                   	.byte 0xe4

f010000c <entry>:
f010000c:	66 c7 05 72 04 00 00 	movw   $0x1234,0x472
f0100013:	34 12 
f0100015:	b8 00 b0 10 00       	mov    $0x10b000,%eax
f010001a:	0f 22 d8             	mov    %eax,%cr3
f010001d:	0f 20 c0             	mov    %cr0,%eax
f0100020:	0d 01 00 01 80       	or     $0x80010001,%eax
f0100025:	0f 22 c0             	mov    %eax,%cr0
f0100028:	b8 2f 00 10 f0       	mov    $0xf010002f,%eax
f010002d:	ff e0                	jmp    *%eax

f010002f <relocated>:
f010002f:	bd 00 00 00 00       	mov    $0x0,%ebp
f0100034:	bc 00 b0 10 f0       	mov    $0xf010b000,%esp
f0100039:	e8 02 00 00 00       	call   f0100040 <i386_init>

f010003e <spin>:
f010003e:	eb fe                	jmp    f010003e <spin>

f0100040 <i386_init>:
f0100040:	55                   	push   %ebp
f0100041:	89 e5                	mov    %esp,%ebp
f0100043:	83 ec 0c             	sub    $0xc,%esp
f0100046:	b8 40 d9 10 f0       	mov    $0xf010d940,%eax
f010004b:	2d 00 d3 10 f0       	sub    $0xf010d300,%eax
f0100050:	50                   	push   %eax
f0100051:	6a 00                	push   $0x0
f0100053:	68 00 d3 10 f0       	push   $0xf010d300
f0100058:	e8 fe 14 00 00       	call   f010155b <memset>
f010005d:	e8 ae 04 00 00       	call   f0100510 <cons_init>
f0100062:	83 c4 08             	add    $0x8,%esp
f0100065:	68 ac 1a 00 00       	push   $0x1aac
f010006a:	68 a0 19 10 f0       	push   $0xf01019a0
f010006f:	e8 e2 09 00 00       	call   f0100a56 <cprintf>
f0100074:	e8 60 08 00 00       	call   f01008d9 <mem_init>
f0100079:	83 c4 10             	add    $0x10,%esp
f010007c:	83 ec 0c             	sub    $0xc,%esp
f010007f:	6a 00                	push   $0x0
f0100081:	e8 f7 06 00 00       	call   f010077d <monitor>
f0100086:	83 c4 10             	add    $0x10,%esp
f0100089:	eb f1                	jmp    f010007c <i386_init+0x3c>

f010008b <_panic>:
f010008b:	55                   	push   %ebp
f010008c:	89 e5                	mov    %esp,%ebp
f010008e:	56                   	push   %esi
f010008f:	53                   	push   %ebx
f0100090:	8b 75 10             	mov    0x10(%ebp),%esi
f0100093:	83 3d 44 d9 10 f0 00 	cmpl   $0x0,0xf010d944
f010009a:	74 0f                	je     f01000ab <_panic+0x20>
f010009c:	83 ec 0c             	sub    $0xc,%esp
f010009f:	6a 00                	push   $0x0
f01000a1:	e8 d7 06 00 00       	call   f010077d <monitor>
f01000a6:	83 c4 10             	add    $0x10,%esp
f01000a9:	eb f1                	jmp    f010009c <_panic+0x11>
f01000ab:	89 35 44 d9 10 f0    	mov    %esi,0xf010d944
f01000b1:	fa                   	cli    
f01000b2:	fc                   	cld    
f01000b3:	8d 5d 14             	lea    0x14(%ebp),%ebx
f01000b6:	83 ec 04             	sub    $0x4,%esp
f01000b9:	ff 75 0c             	pushl  0xc(%ebp)
f01000bc:	ff 75 08             	pushl  0x8(%ebp)
f01000bf:	68 bb 19 10 f0       	push   $0xf01019bb
f01000c4:	e8 8d 09 00 00       	call   f0100a56 <cprintf>
f01000c9:	83 c4 08             	add    $0x8,%esp
f01000cc:	53                   	push   %ebx
f01000cd:	56                   	push   %esi
f01000ce:	e8 5d 09 00 00       	call   f0100a30 <vcprintf>
f01000d3:	c7 04 24 f7 19 10 f0 	movl   $0xf01019f7,(%esp)
f01000da:	e8 77 09 00 00       	call   f0100a56 <cprintf>
f01000df:	83 c4 10             	add    $0x10,%esp
f01000e2:	eb b8                	jmp    f010009c <_panic+0x11>

f01000e4 <_warn>:
f01000e4:	55                   	push   %ebp
f01000e5:	89 e5                	mov    %esp,%ebp
f01000e7:	53                   	push   %ebx
f01000e8:	83 ec 08             	sub    $0x8,%esp
f01000eb:	8d 5d 14             	lea    0x14(%ebp),%ebx
f01000ee:	ff 75 0c             	pushl  0xc(%ebp)
f01000f1:	ff 75 08             	pushl  0x8(%ebp)
f01000f4:	68 d3 19 10 f0       	push   $0xf01019d3
f01000f9:	e8 58 09 00 00       	call   f0100a56 <cprintf>
f01000fe:	83 c4 08             	add    $0x8,%esp
f0100101:	53                   	push   %ebx
f0100102:	ff 75 10             	pushl  0x10(%ebp)
f0100105:	e8 26 09 00 00       	call   f0100a30 <vcprintf>
f010010a:	c7 04 24 f7 19 10 f0 	movl   $0xf01019f7,(%esp)
f0100111:	e8 40 09 00 00       	call   f0100a56 <cprintf>
f0100116:	83 c4 10             	add    $0x10,%esp
f0100119:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f010011c:	c9                   	leave  
f010011d:	c3                   	ret    

f010011e <serial_proc_data>:
f010011e:	55                   	push   %ebp
f010011f:	89 e5                	mov    %esp,%ebp
f0100121:	ba fd 03 00 00       	mov    $0x3fd,%edx
f0100126:	ec                   	in     (%dx),%al
f0100127:	a8 01                	test   $0x1,%al
f0100129:	74 0b                	je     f0100136 <serial_proc_data+0x18>
f010012b:	ba f8 03 00 00       	mov    $0x3f8,%edx
f0100130:	ec                   	in     (%dx),%al
f0100131:	0f b6 c0             	movzbl %al,%eax
f0100134:	5d                   	pop    %ebp
f0100135:	c3                   	ret    
f0100136:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
f010013b:	eb f7                	jmp    f0100134 <serial_proc_data+0x16>

f010013d <cons_intr>:
f010013d:	55                   	push   %ebp
f010013e:	89 e5                	mov    %esp,%ebp
f0100140:	53                   	push   %ebx
f0100141:	83 ec 04             	sub    $0x4,%esp
f0100144:	89 c3                	mov    %eax,%ebx
f0100146:	ff d3                	call   *%ebx
f0100148:	83 f8 ff             	cmp    $0xffffffff,%eax
f010014b:	74 2d                	je     f010017a <cons_intr+0x3d>
f010014d:	85 c0                	test   %eax,%eax
f010014f:	74 f5                	je     f0100146 <cons_intr+0x9>
f0100151:	8b 0d 24 d5 10 f0    	mov    0xf010d524,%ecx
f0100157:	8d 51 01             	lea    0x1(%ecx),%edx
f010015a:	89 15 24 d5 10 f0    	mov    %edx,0xf010d524
f0100160:	88 81 20 d3 10 f0    	mov    %al,-0xfef2ce0(%ecx)
f0100166:	81 fa 00 02 00 00    	cmp    $0x200,%edx
f010016c:	75 d8                	jne    f0100146 <cons_intr+0x9>
f010016e:	c7 05 24 d5 10 f0 00 	movl   $0x0,0xf010d524
f0100175:	00 00 00 
f0100178:	eb cc                	jmp    f0100146 <cons_intr+0x9>
f010017a:	83 c4 04             	add    $0x4,%esp
f010017d:	5b                   	pop    %ebx
f010017e:	5d                   	pop    %ebp
f010017f:	c3                   	ret    

f0100180 <kbd_proc_data>:
f0100180:	55                   	push   %ebp
f0100181:	89 e5                	mov    %esp,%ebp
f0100183:	53                   	push   %ebx
f0100184:	83 ec 04             	sub    $0x4,%esp
f0100187:	ba 64 00 00 00       	mov    $0x64,%edx
f010018c:	ec                   	in     (%dx),%al
f010018d:	a8 01                	test   $0x1,%al
f010018f:	0f 84 fa 00 00 00    	je     f010028f <kbd_proc_data+0x10f>
f0100195:	a8 20                	test   $0x20,%al
f0100197:	0f 85 f9 00 00 00    	jne    f0100296 <kbd_proc_data+0x116>
f010019d:	ba 60 00 00 00       	mov    $0x60,%edx
f01001a2:	ec                   	in     (%dx),%al
f01001a3:	89 c2                	mov    %eax,%edx
f01001a5:	3c e0                	cmp    $0xe0,%al
f01001a7:	0f 84 8e 00 00 00    	je     f010023b <kbd_proc_data+0xbb>
f01001ad:	84 c0                	test   %al,%al
f01001af:	0f 88 99 00 00 00    	js     f010024e <kbd_proc_data+0xce>
f01001b5:	8b 0d 00 d3 10 f0    	mov    0xf010d300,%ecx
f01001bb:	f6 c1 40             	test   $0x40,%cl
f01001be:	74 0e                	je     f01001ce <kbd_proc_data+0x4e>
f01001c0:	83 c8 80             	or     $0xffffff80,%eax
f01001c3:	89 c2                	mov    %eax,%edx
f01001c5:	83 e1 bf             	and    $0xffffffbf,%ecx
f01001c8:	89 0d 00 d3 10 f0    	mov    %ecx,0xf010d300
f01001ce:	0f b6 d2             	movzbl %dl,%edx
f01001d1:	0f b6 82 40 1b 10 f0 	movzbl -0xfefe4c0(%edx),%eax
f01001d8:	0b 05 00 d3 10 f0    	or     0xf010d300,%eax
f01001de:	0f b6 8a 40 1a 10 f0 	movzbl -0xfefe5c0(%edx),%ecx
f01001e5:	31 c8                	xor    %ecx,%eax
f01001e7:	a3 00 d3 10 f0       	mov    %eax,0xf010d300
f01001ec:	89 c1                	mov    %eax,%ecx
f01001ee:	83 e1 03             	and    $0x3,%ecx
f01001f1:	8b 0c 8d 20 1a 10 f0 	mov    -0xfefe5e0(,%ecx,4),%ecx
f01001f8:	0f b6 14 11          	movzbl (%ecx,%edx,1),%edx
f01001fc:	0f b6 da             	movzbl %dl,%ebx
f01001ff:	a8 08                	test   $0x8,%al
f0100201:	74 0d                	je     f0100210 <kbd_proc_data+0x90>
f0100203:	89 da                	mov    %ebx,%edx
f0100205:	8d 4b 9f             	lea    -0x61(%ebx),%ecx
f0100208:	83 f9 19             	cmp    $0x19,%ecx
f010020b:	77 74                	ja     f0100281 <kbd_proc_data+0x101>
f010020d:	83 eb 20             	sub    $0x20,%ebx
f0100210:	f7 d0                	not    %eax
f0100212:	a8 06                	test   $0x6,%al
f0100214:	75 31                	jne    f0100247 <kbd_proc_data+0xc7>
f0100216:	81 fb e9 00 00 00    	cmp    $0xe9,%ebx
f010021c:	75 29                	jne    f0100247 <kbd_proc_data+0xc7>
f010021e:	83 ec 0c             	sub    $0xc,%esp
f0100221:	68 ed 19 10 f0       	push   $0xf01019ed
f0100226:	e8 2b 08 00 00       	call   f0100a56 <cprintf>
f010022b:	b8 03 00 00 00       	mov    $0x3,%eax
f0100230:	ba 92 00 00 00       	mov    $0x92,%edx
f0100235:	ee                   	out    %al,(%dx)
f0100236:	83 c4 10             	add    $0x10,%esp
f0100239:	eb 0c                	jmp    f0100247 <kbd_proc_data+0xc7>
f010023b:	83 0d 00 d3 10 f0 40 	orl    $0x40,0xf010d300
f0100242:	bb 00 00 00 00       	mov    $0x0,%ebx
f0100247:	89 d8                	mov    %ebx,%eax
f0100249:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f010024c:	c9                   	leave  
f010024d:	c3                   	ret    
f010024e:	8b 0d 00 d3 10 f0    	mov    0xf010d300,%ecx
f0100254:	89 cb                	mov    %ecx,%ebx
f0100256:	83 e3 40             	and    $0x40,%ebx
f0100259:	83 e0 7f             	and    $0x7f,%eax
f010025c:	85 db                	test   %ebx,%ebx
f010025e:	0f 44 d0             	cmove  %eax,%edx
f0100261:	0f b6 d2             	movzbl %dl,%edx
f0100264:	0f b6 82 40 1b 10 f0 	movzbl -0xfefe4c0(%edx),%eax
f010026b:	83 c8 40             	or     $0x40,%eax
f010026e:	0f b6 c0             	movzbl %al,%eax
f0100271:	f7 d0                	not    %eax
f0100273:	21 c8                	and    %ecx,%eax
f0100275:	a3 00 d3 10 f0       	mov    %eax,0xf010d300
f010027a:	bb 00 00 00 00       	mov    $0x0,%ebx
f010027f:	eb c6                	jmp    f0100247 <kbd_proc_data+0xc7>
f0100281:	83 ea 41             	sub    $0x41,%edx
f0100284:	8d 4b 20             	lea    0x20(%ebx),%ecx
f0100287:	83 fa 1a             	cmp    $0x1a,%edx
f010028a:	0f 42 d9             	cmovb  %ecx,%ebx
f010028d:	eb 81                	jmp    f0100210 <kbd_proc_data+0x90>
f010028f:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
f0100294:	eb b1                	jmp    f0100247 <kbd_proc_data+0xc7>
f0100296:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
f010029b:	eb aa                	jmp    f0100247 <kbd_proc_data+0xc7>

f010029d <cons_putc>:
f010029d:	55                   	push   %ebp
f010029e:	89 e5                	mov    %esp,%ebp
f01002a0:	57                   	push   %edi
f01002a1:	56                   	push   %esi
f01002a2:	53                   	push   %ebx
f01002a3:	83 ec 1c             	sub    $0x1c,%esp
f01002a6:	89 c7                	mov    %eax,%edi
f01002a8:	bb 00 00 00 00       	mov    $0x0,%ebx
f01002ad:	be fd 03 00 00       	mov    $0x3fd,%esi
f01002b2:	b9 84 00 00 00       	mov    $0x84,%ecx
f01002b7:	eb 09                	jmp    f01002c2 <cons_putc+0x25>
f01002b9:	89 ca                	mov    %ecx,%edx
f01002bb:	ec                   	in     (%dx),%al
f01002bc:	ec                   	in     (%dx),%al
f01002bd:	ec                   	in     (%dx),%al
f01002be:	ec                   	in     (%dx),%al
f01002bf:	83 c3 01             	add    $0x1,%ebx
f01002c2:	89 f2                	mov    %esi,%edx
f01002c4:	ec                   	in     (%dx),%al
f01002c5:	a8 20                	test   $0x20,%al
f01002c7:	75 08                	jne    f01002d1 <cons_putc+0x34>
f01002c9:	81 fb ff 31 00 00    	cmp    $0x31ff,%ebx
f01002cf:	7e e8                	jle    f01002b9 <cons_putc+0x1c>
f01002d1:	89 f8                	mov    %edi,%eax
f01002d3:	88 45 e7             	mov    %al,-0x19(%ebp)
f01002d6:	ba f8 03 00 00       	mov    $0x3f8,%edx
f01002db:	ee                   	out    %al,(%dx)
f01002dc:	bb 00 00 00 00       	mov    $0x0,%ebx
f01002e1:	be 79 03 00 00       	mov    $0x379,%esi
f01002e6:	b9 84 00 00 00       	mov    $0x84,%ecx
f01002eb:	eb 09                	jmp    f01002f6 <cons_putc+0x59>
f01002ed:	89 ca                	mov    %ecx,%edx
f01002ef:	ec                   	in     (%dx),%al
f01002f0:	ec                   	in     (%dx),%al
f01002f1:	ec                   	in     (%dx),%al
f01002f2:	ec                   	in     (%dx),%al
f01002f3:	83 c3 01             	add    $0x1,%ebx
f01002f6:	89 f2                	mov    %esi,%edx
f01002f8:	ec                   	in     (%dx),%al
f01002f9:	81 fb ff 31 00 00    	cmp    $0x31ff,%ebx
f01002ff:	7f 04                	jg     f0100305 <cons_putc+0x68>
f0100301:	84 c0                	test   %al,%al
f0100303:	79 e8                	jns    f01002ed <cons_putc+0x50>
f0100305:	ba 78 03 00 00       	mov    $0x378,%edx
f010030a:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
f010030e:	ee                   	out    %al,(%dx)
f010030f:	ba 7a 03 00 00       	mov    $0x37a,%edx
f0100314:	b8 0d 00 00 00       	mov    $0xd,%eax
f0100319:	ee                   	out    %al,(%dx)
f010031a:	b8 08 00 00 00       	mov    $0x8,%eax
f010031f:	ee                   	out    %al,(%dx)
f0100320:	89 fa                	mov    %edi,%edx
f0100322:	81 e2 00 ff ff ff    	and    $0xffffff00,%edx
f0100328:	89 f8                	mov    %edi,%eax
f010032a:	80 cc 07             	or     $0x7,%ah
f010032d:	85 d2                	test   %edx,%edx
f010032f:	0f 44 f8             	cmove  %eax,%edi
f0100332:	89 f8                	mov    %edi,%eax
f0100334:	0f b6 c0             	movzbl %al,%eax
f0100337:	83 f8 09             	cmp    $0x9,%eax
f010033a:	0f 84 b6 00 00 00    	je     f01003f6 <cons_putc+0x159>
f0100340:	83 f8 09             	cmp    $0x9,%eax
f0100343:	7e 73                	jle    f01003b8 <cons_putc+0x11b>
f0100345:	83 f8 0a             	cmp    $0xa,%eax
f0100348:	0f 84 9b 00 00 00    	je     f01003e9 <cons_putc+0x14c>
f010034e:	83 f8 0d             	cmp    $0xd,%eax
f0100351:	0f 85 d6 00 00 00    	jne    f010042d <cons_putc+0x190>
f0100357:	0f b7 05 28 d5 10 f0 	movzwl 0xf010d528,%eax
f010035e:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
f0100364:	c1 e8 16             	shr    $0x16,%eax
f0100367:	8d 04 80             	lea    (%eax,%eax,4),%eax
f010036a:	c1 e0 04             	shl    $0x4,%eax
f010036d:	66 a3 28 d5 10 f0    	mov    %ax,0xf010d528
f0100373:	66 81 3d 28 d5 10 f0 	cmpw   $0x7cf,0xf010d528
f010037a:	cf 07 
f010037c:	0f 87 ce 00 00 00    	ja     f0100450 <cons_putc+0x1b3>
f0100382:	8b 0d 30 d5 10 f0    	mov    0xf010d530,%ecx
f0100388:	b8 0e 00 00 00       	mov    $0xe,%eax
f010038d:	89 ca                	mov    %ecx,%edx
f010038f:	ee                   	out    %al,(%dx)
f0100390:	0f b7 1d 28 d5 10 f0 	movzwl 0xf010d528,%ebx
f0100397:	8d 71 01             	lea    0x1(%ecx),%esi
f010039a:	89 d8                	mov    %ebx,%eax
f010039c:	66 c1 e8 08          	shr    $0x8,%ax
f01003a0:	89 f2                	mov    %esi,%edx
f01003a2:	ee                   	out    %al,(%dx)
f01003a3:	b8 0f 00 00 00       	mov    $0xf,%eax
f01003a8:	89 ca                	mov    %ecx,%edx
f01003aa:	ee                   	out    %al,(%dx)
f01003ab:	89 d8                	mov    %ebx,%eax
f01003ad:	89 f2                	mov    %esi,%edx
f01003af:	ee                   	out    %al,(%dx)
f01003b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
f01003b3:	5b                   	pop    %ebx
f01003b4:	5e                   	pop    %esi
f01003b5:	5f                   	pop    %edi
f01003b6:	5d                   	pop    %ebp
f01003b7:	c3                   	ret    
f01003b8:	83 f8 08             	cmp    $0x8,%eax
f01003bb:	75 70                	jne    f010042d <cons_putc+0x190>
f01003bd:	0f b7 05 28 d5 10 f0 	movzwl 0xf010d528,%eax
f01003c4:	66 85 c0             	test   %ax,%ax
f01003c7:	74 b9                	je     f0100382 <cons_putc+0xe5>
f01003c9:	83 e8 01             	sub    $0x1,%eax
f01003cc:	66 a3 28 d5 10 f0    	mov    %ax,0xf010d528
f01003d2:	0f b7 c0             	movzwl %ax,%eax
f01003d5:	66 81 e7 00 ff       	and    $0xff00,%di
f01003da:	83 cf 20             	or     $0x20,%edi
f01003dd:	8b 15 2c d5 10 f0    	mov    0xf010d52c,%edx
f01003e3:	66 89 3c 42          	mov    %di,(%edx,%eax,2)
f01003e7:	eb 8a                	jmp    f0100373 <cons_putc+0xd6>
f01003e9:	66 83 05 28 d5 10 f0 	addw   $0x50,0xf010d528
f01003f0:	50 
f01003f1:	e9 61 ff ff ff       	jmp    f0100357 <cons_putc+0xba>
f01003f6:	b8 20 00 00 00       	mov    $0x20,%eax
f01003fb:	e8 9d fe ff ff       	call   f010029d <cons_putc>
f0100400:	b8 20 00 00 00       	mov    $0x20,%eax
f0100405:	e8 93 fe ff ff       	call   f010029d <cons_putc>
f010040a:	b8 20 00 00 00       	mov    $0x20,%eax
f010040f:	e8 89 fe ff ff       	call   f010029d <cons_putc>
f0100414:	b8 20 00 00 00       	mov    $0x20,%eax
f0100419:	e8 7f fe ff ff       	call   f010029d <cons_putc>
f010041e:	b8 20 00 00 00       	mov    $0x20,%eax
f0100423:	e8 75 fe ff ff       	call   f010029d <cons_putc>
f0100428:	e9 46 ff ff ff       	jmp    f0100373 <cons_putc+0xd6>
f010042d:	0f b7 05 28 d5 10 f0 	movzwl 0xf010d528,%eax
f0100434:	8d 50 01             	lea    0x1(%eax),%edx
f0100437:	66 89 15 28 d5 10 f0 	mov    %dx,0xf010d528
f010043e:	0f b7 c0             	movzwl %ax,%eax
f0100441:	8b 15 2c d5 10 f0    	mov    0xf010d52c,%edx
f0100447:	66 89 3c 42          	mov    %di,(%edx,%eax,2)
f010044b:	e9 23 ff ff ff       	jmp    f0100373 <cons_putc+0xd6>
f0100450:	a1 2c d5 10 f0       	mov    0xf010d52c,%eax
f0100455:	83 ec 04             	sub    $0x4,%esp
f0100458:	68 00 0f 00 00       	push   $0xf00
f010045d:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
f0100463:	52                   	push   %edx
f0100464:	50                   	push   %eax
f0100465:	e8 3e 11 00 00       	call   f01015a8 <memmove>
f010046a:	8b 15 2c d5 10 f0    	mov    0xf010d52c,%edx
f0100470:	8d 82 00 0f 00 00    	lea    0xf00(%edx),%eax
f0100476:	81 c2 a0 0f 00 00    	add    $0xfa0,%edx
f010047c:	83 c4 10             	add    $0x10,%esp
f010047f:	66 c7 00 20 07       	movw   $0x720,(%eax)
f0100484:	83 c0 02             	add    $0x2,%eax
f0100487:	39 d0                	cmp    %edx,%eax
f0100489:	75 f4                	jne    f010047f <cons_putc+0x1e2>
f010048b:	66 83 2d 28 d5 10 f0 	subw   $0x50,0xf010d528
f0100492:	50 
f0100493:	e9 ea fe ff ff       	jmp    f0100382 <cons_putc+0xe5>

f0100498 <serial_intr>:
f0100498:	80 3d 34 d5 10 f0 00 	cmpb   $0x0,0xf010d534
f010049f:	75 02                	jne    f01004a3 <serial_intr+0xb>
f01004a1:	f3 c3                	repz ret 
f01004a3:	55                   	push   %ebp
f01004a4:	89 e5                	mov    %esp,%ebp
f01004a6:	83 ec 08             	sub    $0x8,%esp
f01004a9:	b8 1e 01 10 f0       	mov    $0xf010011e,%eax
f01004ae:	e8 8a fc ff ff       	call   f010013d <cons_intr>
f01004b3:	c9                   	leave  
f01004b4:	c3                   	ret    

f01004b5 <kbd_intr>:
f01004b5:	55                   	push   %ebp
f01004b6:	89 e5                	mov    %esp,%ebp
f01004b8:	83 ec 08             	sub    $0x8,%esp
f01004bb:	b8 80 01 10 f0       	mov    $0xf0100180,%eax
f01004c0:	e8 78 fc ff ff       	call   f010013d <cons_intr>
f01004c5:	c9                   	leave  
f01004c6:	c3                   	ret    

f01004c7 <cons_getc>:
f01004c7:	55                   	push   %ebp
f01004c8:	89 e5                	mov    %esp,%ebp
f01004ca:	83 ec 08             	sub    $0x8,%esp
f01004cd:	e8 c6 ff ff ff       	call   f0100498 <serial_intr>
f01004d2:	e8 de ff ff ff       	call   f01004b5 <kbd_intr>
f01004d7:	8b 15 20 d5 10 f0    	mov    0xf010d520,%edx
f01004dd:	b8 00 00 00 00       	mov    $0x0,%eax
f01004e2:	3b 15 24 d5 10 f0    	cmp    0xf010d524,%edx
f01004e8:	74 18                	je     f0100502 <cons_getc+0x3b>
f01004ea:	8d 4a 01             	lea    0x1(%edx),%ecx
f01004ed:	89 0d 20 d5 10 f0    	mov    %ecx,0xf010d520
f01004f3:	0f b6 82 20 d3 10 f0 	movzbl -0xfef2ce0(%edx),%eax
f01004fa:	81 f9 00 02 00 00    	cmp    $0x200,%ecx
f0100500:	74 02                	je     f0100504 <cons_getc+0x3d>
f0100502:	c9                   	leave  
f0100503:	c3                   	ret    
f0100504:	c7 05 20 d5 10 f0 00 	movl   $0x0,0xf010d520
f010050b:	00 00 00 
f010050e:	eb f2                	jmp    f0100502 <cons_getc+0x3b>

f0100510 <cons_init>:
f0100510:	55                   	push   %ebp
f0100511:	89 e5                	mov    %esp,%ebp
f0100513:	57                   	push   %edi
f0100514:	56                   	push   %esi
f0100515:	53                   	push   %ebx
f0100516:	83 ec 0c             	sub    $0xc,%esp
f0100519:	0f b7 15 00 80 0b f0 	movzwl 0xf00b8000,%edx
f0100520:	66 c7 05 00 80 0b f0 	movw   $0xa55a,0xf00b8000
f0100527:	5a a5 
f0100529:	0f b7 05 00 80 0b f0 	movzwl 0xf00b8000,%eax
f0100530:	66 3d 5a a5          	cmp    $0xa55a,%ax
f0100534:	0f 84 b7 00 00 00    	je     f01005f1 <cons_init+0xe1>
f010053a:	c7 05 30 d5 10 f0 b4 	movl   $0x3b4,0xf010d530
f0100541:	03 00 00 
f0100544:	be 00 00 0b f0       	mov    $0xf00b0000,%esi
f0100549:	8b 3d 30 d5 10 f0    	mov    0xf010d530,%edi
f010054f:	b8 0e 00 00 00       	mov    $0xe,%eax
f0100554:	89 fa                	mov    %edi,%edx
f0100556:	ee                   	out    %al,(%dx)
f0100557:	8d 4f 01             	lea    0x1(%edi),%ecx
f010055a:	89 ca                	mov    %ecx,%edx
f010055c:	ec                   	in     (%dx),%al
f010055d:	0f b6 c0             	movzbl %al,%eax
f0100560:	c1 e0 08             	shl    $0x8,%eax
f0100563:	89 c3                	mov    %eax,%ebx
f0100565:	b8 0f 00 00 00       	mov    $0xf,%eax
f010056a:	89 fa                	mov    %edi,%edx
f010056c:	ee                   	out    %al,(%dx)
f010056d:	89 ca                	mov    %ecx,%edx
f010056f:	ec                   	in     (%dx),%al
f0100570:	89 35 2c d5 10 f0    	mov    %esi,0xf010d52c
f0100576:	0f b6 c0             	movzbl %al,%eax
f0100579:	09 d8                	or     %ebx,%eax
f010057b:	66 a3 28 d5 10 f0    	mov    %ax,0xf010d528
f0100581:	bb 00 00 00 00       	mov    $0x0,%ebx
f0100586:	b9 fa 03 00 00       	mov    $0x3fa,%ecx
f010058b:	89 d8                	mov    %ebx,%eax
f010058d:	89 ca                	mov    %ecx,%edx
f010058f:	ee                   	out    %al,(%dx)
f0100590:	bf fb 03 00 00       	mov    $0x3fb,%edi
f0100595:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
f010059a:	89 fa                	mov    %edi,%edx
f010059c:	ee                   	out    %al,(%dx)
f010059d:	b8 0c 00 00 00       	mov    $0xc,%eax
f01005a2:	ba f8 03 00 00       	mov    $0x3f8,%edx
f01005a7:	ee                   	out    %al,(%dx)
f01005a8:	be f9 03 00 00       	mov    $0x3f9,%esi
f01005ad:	89 d8                	mov    %ebx,%eax
f01005af:	89 f2                	mov    %esi,%edx
f01005b1:	ee                   	out    %al,(%dx)
f01005b2:	b8 03 00 00 00       	mov    $0x3,%eax
f01005b7:	89 fa                	mov    %edi,%edx
f01005b9:	ee                   	out    %al,(%dx)
f01005ba:	ba fc 03 00 00       	mov    $0x3fc,%edx
f01005bf:	89 d8                	mov    %ebx,%eax
f01005c1:	ee                   	out    %al,(%dx)
f01005c2:	b8 01 00 00 00       	mov    $0x1,%eax
f01005c7:	89 f2                	mov    %esi,%edx
f01005c9:	ee                   	out    %al,(%dx)
f01005ca:	ba fd 03 00 00       	mov    $0x3fd,%edx
f01005cf:	ec                   	in     (%dx),%al
f01005d0:	89 c3                	mov    %eax,%ebx
f01005d2:	3c ff                	cmp    $0xff,%al
f01005d4:	0f 95 05 34 d5 10 f0 	setne  0xf010d534
f01005db:	89 ca                	mov    %ecx,%edx
f01005dd:	ec                   	in     (%dx),%al
f01005de:	ba f8 03 00 00       	mov    $0x3f8,%edx
f01005e3:	ec                   	in     (%dx),%al
f01005e4:	80 fb ff             	cmp    $0xff,%bl
f01005e7:	74 23                	je     f010060c <cons_init+0xfc>
f01005e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
f01005ec:	5b                   	pop    %ebx
f01005ed:	5e                   	pop    %esi
f01005ee:	5f                   	pop    %edi
f01005ef:	5d                   	pop    %ebp
f01005f0:	c3                   	ret    
f01005f1:	66 89 15 00 80 0b f0 	mov    %dx,0xf00b8000
f01005f8:	c7 05 30 d5 10 f0 d4 	movl   $0x3d4,0xf010d530
f01005ff:	03 00 00 
f0100602:	be 00 80 0b f0       	mov    $0xf00b8000,%esi
f0100607:	e9 3d ff ff ff       	jmp    f0100549 <cons_init+0x39>
f010060c:	83 ec 0c             	sub    $0xc,%esp
f010060f:	68 f9 19 10 f0       	push   $0xf01019f9
f0100614:	e8 3d 04 00 00       	call   f0100a56 <cprintf>
f0100619:	83 c4 10             	add    $0x10,%esp
f010061c:	eb cb                	jmp    f01005e9 <cons_init+0xd9>

f010061e <cputchar>:
f010061e:	55                   	push   %ebp
f010061f:	89 e5                	mov    %esp,%ebp
f0100621:	83 ec 08             	sub    $0x8,%esp
f0100624:	8b 45 08             	mov    0x8(%ebp),%eax
f0100627:	e8 71 fc ff ff       	call   f010029d <cons_putc>
f010062c:	c9                   	leave  
f010062d:	c3                   	ret    

f010062e <getchar>:
f010062e:	55                   	push   %ebp
f010062f:	89 e5                	mov    %esp,%ebp
f0100631:	83 ec 08             	sub    $0x8,%esp
f0100634:	e8 8e fe ff ff       	call   f01004c7 <cons_getc>
f0100639:	85 c0                	test   %eax,%eax
f010063b:	74 f7                	je     f0100634 <getchar+0x6>
f010063d:	c9                   	leave  
f010063e:	c3                   	ret    

f010063f <iscons>:
f010063f:	55                   	push   %ebp
f0100640:	89 e5                	mov    %esp,%ebp
f0100642:	b8 01 00 00 00       	mov    $0x1,%eax
f0100647:	5d                   	pop    %ebp
f0100648:	c3                   	ret    

f0100649 <mon_help>:
f0100649:	55                   	push   %ebp
f010064a:	89 e5                	mov    %esp,%ebp
f010064c:	83 ec 0c             	sub    $0xc,%esp
f010064f:	68 40 1c 10 f0       	push   $0xf0101c40
f0100654:	68 5e 1c 10 f0       	push   $0xf0101c5e
f0100659:	68 63 1c 10 f0       	push   $0xf0101c63
f010065e:	e8 f3 03 00 00       	call   f0100a56 <cprintf>
f0100663:	83 c4 0c             	add    $0xc,%esp
f0100666:	68 d8 1c 10 f0       	push   $0xf0101cd8
f010066b:	68 6c 1c 10 f0       	push   $0xf0101c6c
f0100670:	68 63 1c 10 f0       	push   $0xf0101c63
f0100675:	e8 dc 03 00 00       	call   f0100a56 <cprintf>
f010067a:	83 c4 0c             	add    $0xc,%esp
f010067d:	68 00 1d 10 f0       	push   $0xf0101d00
f0100682:	68 75 1c 10 f0       	push   $0xf0101c75
f0100687:	68 63 1c 10 f0       	push   $0xf0101c63
f010068c:	e8 c5 03 00 00       	call   f0100a56 <cprintf>
f0100691:	b8 00 00 00 00       	mov    $0x0,%eax
f0100696:	c9                   	leave  
f0100697:	c3                   	ret    

f0100698 <mon_kerninfo>:
f0100698:	55                   	push   %ebp
f0100699:	89 e5                	mov    %esp,%ebp
f010069b:	83 ec 14             	sub    $0x14,%esp
f010069e:	68 83 1c 10 f0       	push   $0xf0101c83
f01006a3:	e8 ae 03 00 00       	call   f0100a56 <cprintf>
f01006a8:	83 c4 08             	add    $0x8,%esp
f01006ab:	68 0c 00 10 00       	push   $0x10000c
f01006b0:	68 24 1d 10 f0       	push   $0xf0101d24
f01006b5:	e8 9c 03 00 00       	call   f0100a56 <cprintf>
f01006ba:	83 c4 0c             	add    $0xc,%esp
f01006bd:	68 0c 00 10 00       	push   $0x10000c
f01006c2:	68 0c 00 10 f0       	push   $0xf010000c
f01006c7:	68 4c 1d 10 f0       	push   $0xf0101d4c
f01006cc:	e8 85 03 00 00       	call   f0100a56 <cprintf>
f01006d1:	83 c4 0c             	add    $0xc,%esp
f01006d4:	68 99 19 10 00       	push   $0x101999
f01006d9:	68 99 19 10 f0       	push   $0xf0101999
f01006de:	68 70 1d 10 f0       	push   $0xf0101d70
f01006e3:	e8 6e 03 00 00       	call   f0100a56 <cprintf>
f01006e8:	83 c4 0c             	add    $0xc,%esp
f01006eb:	68 00 d3 10 00       	push   $0x10d300
f01006f0:	68 00 d3 10 f0       	push   $0xf010d300
f01006f5:	68 94 1d 10 f0       	push   $0xf0101d94
f01006fa:	e8 57 03 00 00       	call   f0100a56 <cprintf>
f01006ff:	83 c4 0c             	add    $0xc,%esp
f0100702:	68 40 d9 10 00       	push   $0x10d940
f0100707:	68 40 d9 10 f0       	push   $0xf010d940
f010070c:	68 b8 1d 10 f0       	push   $0xf0101db8
f0100711:	e8 40 03 00 00       	call   f0100a56 <cprintf>
f0100716:	83 c4 08             	add    $0x8,%esp
f0100719:	b8 3f dd 10 f0       	mov    $0xf010dd3f,%eax
f010071e:	2d 0c 00 10 f0       	sub    $0xf010000c,%eax
f0100723:	c1 f8 0a             	sar    $0xa,%eax
f0100726:	50                   	push   %eax
f0100727:	68 dc 1d 10 f0       	push   $0xf0101ddc
f010072c:	e8 25 03 00 00       	call   f0100a56 <cprintf>
f0100731:	b8 00 00 00 00       	mov    $0x0,%eax
f0100736:	c9                   	leave  
f0100737:	c3                   	ret    

f0100738 <mon_backtrace>:
f0100738:	55                   	push   %ebp
f0100739:	89 e5                	mov    %esp,%ebp
f010073b:	53                   	push   %ebx
f010073c:	83 ec 04             	sub    $0x4,%esp
f010073f:	89 e8                	mov    %ebp,%eax
f0100741:	89 c3                	mov    %eax,%ebx
f0100743:	8d 50 04             	lea    0x4(%eax),%edx
f0100746:	83 c0 08             	add    $0x8,%eax
f0100749:	eb 24                	jmp    f010076f <mon_backtrace+0x37>
f010074b:	ff 70 10             	pushl  0x10(%eax)
f010074e:	ff 70 0c             	pushl  0xc(%eax)
f0100751:	ff 70 08             	pushl  0x8(%eax)
f0100754:	ff 70 04             	pushl  0x4(%eax)
f0100757:	ff 30                	pushl  (%eax)
f0100759:	52                   	push   %edx
f010075a:	53                   	push   %ebx
f010075b:	68 08 1e 10 f0       	push   $0xf0101e08
f0100760:	e8 f1 02 00 00       	call   f0100a56 <cprintf>
f0100765:	8b 1b                	mov    (%ebx),%ebx
f0100767:	8d 43 04             	lea    0x4(%ebx),%eax
f010076a:	89 c2                	mov    %eax,%edx
f010076c:	83 c4 20             	add    $0x20,%esp
f010076f:	85 db                	test   %ebx,%ebx
f0100771:	75 d8                	jne    f010074b <mon_backtrace+0x13>
f0100773:	b8 00 00 00 00       	mov    $0x0,%eax
f0100778:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f010077b:	c9                   	leave  
f010077c:	c3                   	ret    

f010077d <monitor>:
f010077d:	55                   	push   %ebp
f010077e:	89 e5                	mov    %esp,%ebp
f0100780:	57                   	push   %edi
f0100781:	56                   	push   %esi
f0100782:	53                   	push   %ebx
f0100783:	83 ec 58             	sub    $0x58,%esp
f0100786:	68 3c 1e 10 f0       	push   $0xf0101e3c
f010078b:	e8 c6 02 00 00       	call   f0100a56 <cprintf>
f0100790:	c7 04 24 60 1e 10 f0 	movl   $0xf0101e60,(%esp)
f0100797:	e8 ba 02 00 00       	call   f0100a56 <cprintf>
f010079c:	83 c4 10             	add    $0x10,%esp
f010079f:	eb 47                	jmp    f01007e8 <monitor+0x6b>
f01007a1:	83 ec 08             	sub    $0x8,%esp
f01007a4:	0f be c0             	movsbl %al,%eax
f01007a7:	50                   	push   %eax
f01007a8:	68 a0 1c 10 f0       	push   $0xf0101ca0
f01007ad:	e8 6c 0d 00 00       	call   f010151e <strchr>
f01007b2:	83 c4 10             	add    $0x10,%esp
f01007b5:	85 c0                	test   %eax,%eax
f01007b7:	74 0a                	je     f01007c3 <monitor+0x46>
f01007b9:	c6 03 00             	movb   $0x0,(%ebx)
f01007bc:	89 fe                	mov    %edi,%esi
f01007be:	8d 5b 01             	lea    0x1(%ebx),%ebx
f01007c1:	eb 6b                	jmp    f010082e <monitor+0xb1>
f01007c3:	80 3b 00             	cmpb   $0x0,(%ebx)
f01007c6:	74 73                	je     f010083b <monitor+0xbe>
f01007c8:	83 ff 0f             	cmp    $0xf,%edi
f01007cb:	74 09                	je     f01007d6 <monitor+0x59>
f01007cd:	8d 77 01             	lea    0x1(%edi),%esi
f01007d0:	89 5c bd a8          	mov    %ebx,-0x58(%ebp,%edi,4)
f01007d4:	eb 39                	jmp    f010080f <monitor+0x92>
f01007d6:	83 ec 08             	sub    $0x8,%esp
f01007d9:	6a 10                	push   $0x10
f01007db:	68 a5 1c 10 f0       	push   $0xf0101ca5
f01007e0:	e8 71 02 00 00       	call   f0100a56 <cprintf>
f01007e5:	83 c4 10             	add    $0x10,%esp
f01007e8:	83 ec 0c             	sub    $0xc,%esp
f01007eb:	68 9c 1c 10 f0       	push   $0xf0101c9c
f01007f0:	e8 0c 0b 00 00       	call   f0101301 <readline>
f01007f5:	89 c3                	mov    %eax,%ebx
f01007f7:	83 c4 10             	add    $0x10,%esp
f01007fa:	85 c0                	test   %eax,%eax
f01007fc:	74 ea                	je     f01007e8 <monitor+0x6b>
f01007fe:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%ebp)
f0100805:	bf 00 00 00 00       	mov    $0x0,%edi
f010080a:	eb 24                	jmp    f0100830 <monitor+0xb3>
f010080c:	83 c3 01             	add    $0x1,%ebx
f010080f:	0f b6 03             	movzbl (%ebx),%eax
f0100812:	84 c0                	test   %al,%al
f0100814:	74 18                	je     f010082e <monitor+0xb1>
f0100816:	83 ec 08             	sub    $0x8,%esp
f0100819:	0f be c0             	movsbl %al,%eax
f010081c:	50                   	push   %eax
f010081d:	68 a0 1c 10 f0       	push   $0xf0101ca0
f0100822:	e8 f7 0c 00 00       	call   f010151e <strchr>
f0100827:	83 c4 10             	add    $0x10,%esp
f010082a:	85 c0                	test   %eax,%eax
f010082c:	74 de                	je     f010080c <monitor+0x8f>
f010082e:	89 f7                	mov    %esi,%edi
f0100830:	0f b6 03             	movzbl (%ebx),%eax
f0100833:	84 c0                	test   %al,%al
f0100835:	0f 85 66 ff ff ff    	jne    f01007a1 <monitor+0x24>
f010083b:	c7 44 bd a8 00 00 00 	movl   $0x0,-0x58(%ebp,%edi,4)
f0100842:	00 
f0100843:	85 ff                	test   %edi,%edi
f0100845:	74 a1                	je     f01007e8 <monitor+0x6b>
f0100847:	bb 00 00 00 00       	mov    $0x0,%ebx
f010084c:	83 ec 08             	sub    $0x8,%esp
f010084f:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
f0100852:	ff 34 85 a0 1e 10 f0 	pushl  -0xfefe160(,%eax,4)
f0100859:	ff 75 a8             	pushl  -0x58(%ebp)
f010085c:	e8 5f 0c 00 00       	call   f01014c0 <strcmp>
f0100861:	83 c4 10             	add    $0x10,%esp
f0100864:	85 c0                	test   %eax,%eax
f0100866:	74 20                	je     f0100888 <monitor+0x10b>
f0100868:	83 c3 01             	add    $0x1,%ebx
f010086b:	83 fb 03             	cmp    $0x3,%ebx
f010086e:	75 dc                	jne    f010084c <monitor+0xcf>
f0100870:	83 ec 08             	sub    $0x8,%esp
f0100873:	ff 75 a8             	pushl  -0x58(%ebp)
f0100876:	68 c2 1c 10 f0       	push   $0xf0101cc2
f010087b:	e8 d6 01 00 00       	call   f0100a56 <cprintf>
f0100880:	83 c4 10             	add    $0x10,%esp
f0100883:	e9 60 ff ff ff       	jmp    f01007e8 <monitor+0x6b>
f0100888:	83 ec 04             	sub    $0x4,%esp
f010088b:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
f010088e:	ff 75 08             	pushl  0x8(%ebp)
f0100891:	8d 55 a8             	lea    -0x58(%ebp),%edx
f0100894:	52                   	push   %edx
f0100895:	57                   	push   %edi
f0100896:	ff 14 85 a8 1e 10 f0 	call   *-0xfefe158(,%eax,4)
f010089d:	83 c4 10             	add    $0x10,%esp
f01008a0:	85 c0                	test   %eax,%eax
f01008a2:	0f 89 40 ff ff ff    	jns    f01007e8 <monitor+0x6b>
f01008a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
f01008ab:	5b                   	pop    %ebx
f01008ac:	5e                   	pop    %esi
f01008ad:	5f                   	pop    %edi
f01008ae:	5d                   	pop    %ebp
f01008af:	c3                   	ret    

f01008b0 <nvram_read>:
f01008b0:	55                   	push   %ebp
f01008b1:	89 e5                	mov    %esp,%ebp
f01008b3:	56                   	push   %esi
f01008b4:	53                   	push   %ebx
f01008b5:	89 c6                	mov    %eax,%esi
f01008b7:	83 ec 0c             	sub    $0xc,%esp
f01008ba:	50                   	push   %eax
f01008bb:	e8 2f 01 00 00       	call   f01009ef <mc146818_read>
f01008c0:	89 c3                	mov    %eax,%ebx
f01008c2:	83 c6 01             	add    $0x1,%esi
f01008c5:	89 34 24             	mov    %esi,(%esp)
f01008c8:	e8 22 01 00 00       	call   f01009ef <mc146818_read>
f01008cd:	c1 e0 08             	shl    $0x8,%eax
f01008d0:	09 d8                	or     %ebx,%eax
f01008d2:	8d 65 f8             	lea    -0x8(%ebp),%esp
f01008d5:	5b                   	pop    %ebx
f01008d6:	5e                   	pop    %esi
f01008d7:	5d                   	pop    %ebp
f01008d8:	c3                   	ret    

f01008d9 <mem_init>:
f01008d9:	55                   	push   %ebp
f01008da:	89 e5                	mov    %esp,%ebp
f01008dc:	56                   	push   %esi
f01008dd:	53                   	push   %ebx
f01008de:	b8 15 00 00 00       	mov    $0x15,%eax
f01008e3:	e8 c8 ff ff ff       	call   f01008b0 <nvram_read>
f01008e8:	89 c3                	mov    %eax,%ebx
f01008ea:	b8 17 00 00 00       	mov    $0x17,%eax
f01008ef:	e8 bc ff ff ff       	call   f01008b0 <nvram_read>
f01008f4:	89 c6                	mov    %eax,%esi
f01008f6:	b8 34 00 00 00       	mov    $0x34,%eax
f01008fb:	e8 b0 ff ff ff       	call   f01008b0 <nvram_read>
f0100900:	c1 e0 06             	shl    $0x6,%eax
f0100903:	85 c0                	test   %eax,%eax
f0100905:	75 0e                	jne    f0100915 <mem_init+0x3c>
f0100907:	89 d8                	mov    %ebx,%eax
f0100909:	85 f6                	test   %esi,%esi
f010090b:	74 0d                	je     f010091a <mem_init+0x41>
f010090d:	8d 86 00 04 00 00    	lea    0x400(%esi),%eax
f0100913:	eb 05                	jmp    f010091a <mem_init+0x41>
f0100915:	05 00 40 00 00       	add    $0x4000,%eax
f010091a:	89 c2                	mov    %eax,%edx
f010091c:	c1 ea 02             	shr    $0x2,%edx
f010091f:	89 15 48 d9 10 f0    	mov    %edx,0xf010d948
f0100925:	89 c2                	mov    %eax,%edx
f0100927:	29 da                	sub    %ebx,%edx
f0100929:	52                   	push   %edx
f010092a:	53                   	push   %ebx
f010092b:	50                   	push   %eax
f010092c:	68 c4 1e 10 f0       	push   $0xf0101ec4
f0100931:	e8 20 01 00 00       	call   f0100a56 <cprintf>
f0100936:	83 c4 0c             	add    $0xc,%esp
f0100939:	68 00 1f 10 f0       	push   $0xf0101f00
f010093e:	68 80 00 00 00       	push   $0x80
f0100943:	68 2c 1f 10 f0       	push   $0xf0101f2c
f0100948:	e8 3e f7 ff ff       	call   f010008b <_panic>

f010094d <page_init>:
f010094d:	55                   	push   %ebp
f010094e:	89 e5                	mov    %esp,%ebp
f0100950:	56                   	push   %esi
f0100951:	53                   	push   %ebx
f0100952:	8b 1d 38 d5 10 f0    	mov    0xf010d538,%ebx
f0100958:	ba 00 00 00 00       	mov    $0x0,%edx
f010095d:	b8 00 00 00 00       	mov    $0x0,%eax
f0100962:	be 01 00 00 00       	mov    $0x1,%esi
f0100967:	eb 24                	jmp    f010098d <page_init+0x40>
f0100969:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
f0100970:	89 d1                	mov    %edx,%ecx
f0100972:	03 0d 50 d9 10 f0    	add    0xf010d950,%ecx
f0100978:	66 c7 41 04 00 00    	movw   $0x0,0x4(%ecx)
f010097e:	89 19                	mov    %ebx,(%ecx)
f0100980:	83 c0 01             	add    $0x1,%eax
f0100983:	89 d3                	mov    %edx,%ebx
f0100985:	03 1d 50 d9 10 f0    	add    0xf010d950,%ebx
f010098b:	89 f2                	mov    %esi,%edx
f010098d:	39 05 48 d9 10 f0    	cmp    %eax,0xf010d948
f0100993:	77 d4                	ja     f0100969 <page_init+0x1c>
f0100995:	84 d2                	test   %dl,%dl
f0100997:	75 04                	jne    f010099d <page_init+0x50>
f0100999:	5b                   	pop    %ebx
f010099a:	5e                   	pop    %esi
f010099b:	5d                   	pop    %ebp
f010099c:	c3                   	ret    
f010099d:	89 1d 38 d5 10 f0    	mov    %ebx,0xf010d538
f01009a3:	eb f4                	jmp    f0100999 <page_init+0x4c>

f01009a5 <page_alloc>:
f01009a5:	55                   	push   %ebp
f01009a6:	89 e5                	mov    %esp,%ebp
f01009a8:	b8 00 00 00 00       	mov    $0x0,%eax
f01009ad:	5d                   	pop    %ebp
f01009ae:	c3                   	ret    

f01009af <page_free>:
f01009af:	55                   	push   %ebp
f01009b0:	89 e5                	mov    %esp,%ebp
f01009b2:	5d                   	pop    %ebp
f01009b3:	c3                   	ret    

f01009b4 <page_decref>:
f01009b4:	55                   	push   %ebp
f01009b5:	89 e5                	mov    %esp,%ebp
f01009b7:	8b 45 08             	mov    0x8(%ebp),%eax
f01009ba:	66 83 68 04 01       	subw   $0x1,0x4(%eax)
f01009bf:	5d                   	pop    %ebp
f01009c0:	c3                   	ret    

f01009c1 <pgdir_walk>:
f01009c1:	55                   	push   %ebp
f01009c2:	89 e5                	mov    %esp,%ebp
f01009c4:	b8 00 00 00 00       	mov    $0x0,%eax
f01009c9:	5d                   	pop    %ebp
f01009ca:	c3                   	ret    

f01009cb <page_insert>:
f01009cb:	55                   	push   %ebp
f01009cc:	89 e5                	mov    %esp,%ebp
f01009ce:	b8 00 00 00 00       	mov    $0x0,%eax
f01009d3:	5d                   	pop    %ebp
f01009d4:	c3                   	ret    

f01009d5 <page_lookup>:
f01009d5:	55                   	push   %ebp
f01009d6:	89 e5                	mov    %esp,%ebp
f01009d8:	b8 00 00 00 00       	mov    $0x0,%eax
f01009dd:	5d                   	pop    %ebp
f01009de:	c3                   	ret    

f01009df <page_remove>:
f01009df:	55                   	push   %ebp
f01009e0:	89 e5                	mov    %esp,%ebp
f01009e2:	5d                   	pop    %ebp
f01009e3:	c3                   	ret    

f01009e4 <tlb_invalidate>:
f01009e4:	55                   	push   %ebp
f01009e5:	89 e5                	mov    %esp,%ebp
f01009e7:	8b 45 0c             	mov    0xc(%ebp),%eax
f01009ea:	0f 01 38             	invlpg (%eax)
f01009ed:	5d                   	pop    %ebp
f01009ee:	c3                   	ret    

f01009ef <mc146818_read>:
f01009ef:	55                   	push   %ebp
f01009f0:	89 e5                	mov    %esp,%ebp
f01009f2:	8b 45 08             	mov    0x8(%ebp),%eax
f01009f5:	ba 70 00 00 00       	mov    $0x70,%edx
f01009fa:	ee                   	out    %al,(%dx)
f01009fb:	ba 71 00 00 00       	mov    $0x71,%edx
f0100a00:	ec                   	in     (%dx),%al
f0100a01:	0f b6 c0             	movzbl %al,%eax
f0100a04:	5d                   	pop    %ebp
f0100a05:	c3                   	ret    

f0100a06 <mc146818_write>:
f0100a06:	55                   	push   %ebp
f0100a07:	89 e5                	mov    %esp,%ebp
f0100a09:	8b 45 08             	mov    0x8(%ebp),%eax
f0100a0c:	ba 70 00 00 00       	mov    $0x70,%edx
f0100a11:	ee                   	out    %al,(%dx)
f0100a12:	8b 45 0c             	mov    0xc(%ebp),%eax
f0100a15:	ba 71 00 00 00       	mov    $0x71,%edx
f0100a1a:	ee                   	out    %al,(%dx)
f0100a1b:	5d                   	pop    %ebp
f0100a1c:	c3                   	ret    

f0100a1d <putch>:
f0100a1d:	55                   	push   %ebp
f0100a1e:	89 e5                	mov    %esp,%ebp
f0100a20:	83 ec 14             	sub    $0x14,%esp
f0100a23:	ff 75 08             	pushl  0x8(%ebp)
f0100a26:	e8 f3 fb ff ff       	call   f010061e <cputchar>
f0100a2b:	83 c4 10             	add    $0x10,%esp
f0100a2e:	c9                   	leave  
f0100a2f:	c3                   	ret    

f0100a30 <vcprintf>:
f0100a30:	55                   	push   %ebp
f0100a31:	89 e5                	mov    %esp,%ebp
f0100a33:	83 ec 18             	sub    $0x18,%esp
f0100a36:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
f0100a3d:	ff 75 0c             	pushl  0xc(%ebp)
f0100a40:	ff 75 08             	pushl  0x8(%ebp)
f0100a43:	8d 45 f4             	lea    -0xc(%ebp),%eax
f0100a46:	50                   	push   %eax
f0100a47:	68 1d 0a 10 f0       	push   $0xf0100a1d
f0100a4c:	e8 c5 03 00 00       	call   f0100e16 <vprintfmt>
f0100a51:	8b 45 f4             	mov    -0xc(%ebp),%eax
f0100a54:	c9                   	leave  
f0100a55:	c3                   	ret    

f0100a56 <cprintf>:
f0100a56:	55                   	push   %ebp
f0100a57:	89 e5                	mov    %esp,%ebp
f0100a59:	83 ec 10             	sub    $0x10,%esp
f0100a5c:	8d 45 0c             	lea    0xc(%ebp),%eax
f0100a5f:	50                   	push   %eax
f0100a60:	ff 75 08             	pushl  0x8(%ebp)
f0100a63:	e8 c8 ff ff ff       	call   f0100a30 <vcprintf>
f0100a68:	c9                   	leave  
f0100a69:	c3                   	ret    

f0100a6a <stab_binsearch>:
f0100a6a:	55                   	push   %ebp
f0100a6b:	89 e5                	mov    %esp,%ebp
f0100a6d:	57                   	push   %edi
f0100a6e:	56                   	push   %esi
f0100a6f:	53                   	push   %ebx
f0100a70:	83 ec 14             	sub    $0x14,%esp
f0100a73:	89 45 ec             	mov    %eax,-0x14(%ebp)
f0100a76:	89 55 e4             	mov    %edx,-0x1c(%ebp)
f0100a79:	89 4d e0             	mov    %ecx,-0x20(%ebp)
f0100a7c:	8b 7d 08             	mov    0x8(%ebp),%edi
f0100a7f:	8b 32                	mov    (%edx),%esi
f0100a81:	8b 01                	mov    (%ecx),%eax
f0100a83:	89 45 f0             	mov    %eax,-0x10(%ebp)
f0100a86:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
f0100a8d:	eb 2f                	jmp    f0100abe <stab_binsearch+0x54>
f0100a8f:	83 e8 01             	sub    $0x1,%eax
f0100a92:	39 c6                	cmp    %eax,%esi
f0100a94:	7f 49                	jg     f0100adf <stab_binsearch+0x75>
f0100a96:	0f b6 0a             	movzbl (%edx),%ecx
f0100a99:	83 ea 0c             	sub    $0xc,%edx
f0100a9c:	39 f9                	cmp    %edi,%ecx
f0100a9e:	75 ef                	jne    f0100a8f <stab_binsearch+0x25>
f0100aa0:	8d 14 40             	lea    (%eax,%eax,2),%edx
f0100aa3:	8b 4d ec             	mov    -0x14(%ebp),%ecx
f0100aa6:	8b 54 91 08          	mov    0x8(%ecx,%edx,4),%edx
f0100aaa:	3b 55 0c             	cmp    0xc(%ebp),%edx
f0100aad:	73 35                	jae    f0100ae4 <stab_binsearch+0x7a>
f0100aaf:	8b 75 e4             	mov    -0x1c(%ebp),%esi
f0100ab2:	89 06                	mov    %eax,(%esi)
f0100ab4:	8d 73 01             	lea    0x1(%ebx),%esi
f0100ab7:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
f0100abe:	3b 75 f0             	cmp    -0x10(%ebp),%esi
f0100ac1:	7f 4e                	jg     f0100b11 <stab_binsearch+0xa7>
f0100ac3:	8b 45 f0             	mov    -0x10(%ebp),%eax
f0100ac6:	01 f0                	add    %esi,%eax
f0100ac8:	89 c3                	mov    %eax,%ebx
f0100aca:	c1 eb 1f             	shr    $0x1f,%ebx
f0100acd:	01 c3                	add    %eax,%ebx
f0100acf:	d1 fb                	sar    %ebx
f0100ad1:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
f0100ad4:	8b 4d ec             	mov    -0x14(%ebp),%ecx
f0100ad7:	8d 54 81 04          	lea    0x4(%ecx,%eax,4),%edx
f0100adb:	89 d8                	mov    %ebx,%eax
f0100add:	eb b3                	jmp    f0100a92 <stab_binsearch+0x28>
f0100adf:	8d 73 01             	lea    0x1(%ebx),%esi
f0100ae2:	eb da                	jmp    f0100abe <stab_binsearch+0x54>
f0100ae4:	3b 55 0c             	cmp    0xc(%ebp),%edx
f0100ae7:	76 14                	jbe    f0100afd <stab_binsearch+0x93>
f0100ae9:	83 e8 01             	sub    $0x1,%eax
f0100aec:	89 45 f0             	mov    %eax,-0x10(%ebp)
f0100aef:	8b 5d e0             	mov    -0x20(%ebp),%ebx
f0100af2:	89 03                	mov    %eax,(%ebx)
f0100af4:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
f0100afb:	eb c1                	jmp    f0100abe <stab_binsearch+0x54>
f0100afd:	8b 75 e4             	mov    -0x1c(%ebp),%esi
f0100b00:	89 06                	mov    %eax,(%esi)
f0100b02:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
f0100b06:	89 c6                	mov    %eax,%esi
f0100b08:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
f0100b0f:	eb ad                	jmp    f0100abe <stab_binsearch+0x54>
f0100b11:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
f0100b15:	74 16                	je     f0100b2d <stab_binsearch+0xc3>
f0100b17:	8b 45 e0             	mov    -0x20(%ebp),%eax
f0100b1a:	8b 00                	mov    (%eax),%eax
f0100b1c:	8b 75 e4             	mov    -0x1c(%ebp),%esi
f0100b1f:	8b 0e                	mov    (%esi),%ecx
f0100b21:	8d 14 40             	lea    (%eax,%eax,2),%edx
f0100b24:	8b 75 ec             	mov    -0x14(%ebp),%esi
f0100b27:	8d 54 96 04          	lea    0x4(%esi,%edx,4),%edx
f0100b2b:	eb 12                	jmp    f0100b3f <stab_binsearch+0xd5>
f0100b2d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
f0100b30:	8b 00                	mov    (%eax),%eax
f0100b32:	83 e8 01             	sub    $0x1,%eax
f0100b35:	8b 7d e0             	mov    -0x20(%ebp),%edi
f0100b38:	89 07                	mov    %eax,(%edi)
f0100b3a:	eb 16                	jmp    f0100b52 <stab_binsearch+0xe8>
f0100b3c:	83 e8 01             	sub    $0x1,%eax
f0100b3f:	39 c1                	cmp    %eax,%ecx
f0100b41:	7d 0a                	jge    f0100b4d <stab_binsearch+0xe3>
f0100b43:	0f b6 1a             	movzbl (%edx),%ebx
f0100b46:	83 ea 0c             	sub    $0xc,%edx
f0100b49:	39 fb                	cmp    %edi,%ebx
f0100b4b:	75 ef                	jne    f0100b3c <stab_binsearch+0xd2>
f0100b4d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
f0100b50:	89 07                	mov    %eax,(%edi)
f0100b52:	83 c4 14             	add    $0x14,%esp
f0100b55:	5b                   	pop    %ebx
f0100b56:	5e                   	pop    %esi
f0100b57:	5f                   	pop    %edi
f0100b58:	5d                   	pop    %ebp
f0100b59:	c3                   	ret    

f0100b5a <debuginfo_eip>:
f0100b5a:	55                   	push   %ebp
f0100b5b:	89 e5                	mov    %esp,%ebp
f0100b5d:	57                   	push   %edi
f0100b5e:	56                   	push   %esi
f0100b5f:	53                   	push   %ebx
f0100b60:	83 ec 1c             	sub    $0x1c,%esp
f0100b63:	8b 7d 08             	mov    0x8(%ebp),%edi
f0100b66:	8b 75 0c             	mov    0xc(%ebp),%esi
f0100b69:	c7 06 38 1f 10 f0    	movl   $0xf0101f38,(%esi)
f0100b6f:	c7 46 04 00 00 00 00 	movl   $0x0,0x4(%esi)
f0100b76:	c7 46 08 38 1f 10 f0 	movl   $0xf0101f38,0x8(%esi)
f0100b7d:	c7 46 0c 09 00 00 00 	movl   $0x9,0xc(%esi)
f0100b84:	89 7e 10             	mov    %edi,0x10(%esi)
f0100b87:	c7 46 14 00 00 00 00 	movl   $0x0,0x14(%esi)
f0100b8e:	81 ff ff ff 7f ef    	cmp    $0xef7fffff,%edi
f0100b94:	0f 86 df 00 00 00    	jbe    f0100c79 <debuginfo_eip+0x11f>
f0100b9a:	b8 71 21 10 f0       	mov    $0xf0102171,%eax
f0100b9f:	3d 71 21 10 f0       	cmp    $0xf0102171,%eax
f0100ba4:	0f 86 61 01 00 00    	jbe    f0100d0b <debuginfo_eip+0x1b1>
f0100baa:	80 3d 70 21 10 f0 00 	cmpb   $0x0,0xf0102170
f0100bb1:	0f 85 5b 01 00 00    	jne    f0100d12 <debuginfo_eip+0x1b8>
f0100bb7:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
f0100bbe:	b8 70 21 10 f0       	mov    $0xf0102170,%eax
f0100bc3:	2d 70 21 10 f0       	sub    $0xf0102170,%eax
f0100bc8:	c1 f8 02             	sar    $0x2,%eax
f0100bcb:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
f0100bd1:	83 e8 01             	sub    $0x1,%eax
f0100bd4:	89 45 e0             	mov    %eax,-0x20(%ebp)
f0100bd7:	83 ec 08             	sub    $0x8,%esp
f0100bda:	57                   	push   %edi
f0100bdb:	6a 64                	push   $0x64
f0100bdd:	8d 4d e0             	lea    -0x20(%ebp),%ecx
f0100be0:	8d 55 e4             	lea    -0x1c(%ebp),%edx
f0100be3:	b8 70 21 10 f0       	mov    $0xf0102170,%eax
f0100be8:	e8 7d fe ff ff       	call   f0100a6a <stab_binsearch>
f0100bed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
f0100bf0:	83 c4 10             	add    $0x10,%esp
f0100bf3:	85 c0                	test   %eax,%eax
f0100bf5:	0f 84 1e 01 00 00    	je     f0100d19 <debuginfo_eip+0x1bf>
f0100bfb:	89 45 dc             	mov    %eax,-0x24(%ebp)
f0100bfe:	8b 45 e0             	mov    -0x20(%ebp),%eax
f0100c01:	89 45 d8             	mov    %eax,-0x28(%ebp)
f0100c04:	83 ec 08             	sub    $0x8,%esp
f0100c07:	57                   	push   %edi
f0100c08:	6a 24                	push   $0x24
f0100c0a:	8d 4d d8             	lea    -0x28(%ebp),%ecx
f0100c0d:	8d 55 dc             	lea    -0x24(%ebp),%edx
f0100c10:	b8 70 21 10 f0       	mov    $0xf0102170,%eax
f0100c15:	e8 50 fe ff ff       	call   f0100a6a <stab_binsearch>
f0100c1a:	8b 5d dc             	mov    -0x24(%ebp),%ebx
f0100c1d:	83 c4 10             	add    $0x10,%esp
f0100c20:	3b 5d d8             	cmp    -0x28(%ebp),%ebx
f0100c23:	7f 68                	jg     f0100c8d <debuginfo_eip+0x133>
f0100c25:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
f0100c28:	c1 e0 02             	shl    $0x2,%eax
f0100c2b:	8d 90 70 21 10 f0    	lea    -0xfefde90(%eax),%edx
f0100c31:	8b 88 70 21 10 f0    	mov    -0xfefde90(%eax),%ecx
f0100c37:	b8 71 21 10 f0       	mov    $0xf0102171,%eax
f0100c3c:	2d 71 21 10 f0       	sub    $0xf0102171,%eax
f0100c41:	39 c1                	cmp    %eax,%ecx
f0100c43:	73 09                	jae    f0100c4e <debuginfo_eip+0xf4>
f0100c45:	81 c1 71 21 10 f0    	add    $0xf0102171,%ecx
f0100c4b:	89 4e 08             	mov    %ecx,0x8(%esi)
f0100c4e:	8b 42 08             	mov    0x8(%edx),%eax
f0100c51:	89 46 10             	mov    %eax,0x10(%esi)
f0100c54:	83 ec 08             	sub    $0x8,%esp
f0100c57:	6a 3a                	push   $0x3a
f0100c59:	ff 76 08             	pushl  0x8(%esi)
f0100c5c:	e8 de 08 00 00       	call   f010153f <strfind>
f0100c61:	2b 46 08             	sub    0x8(%esi),%eax
f0100c64:	89 46 0c             	mov    %eax,0xc(%esi)
f0100c67:	8b 7d e4             	mov    -0x1c(%ebp),%edi
f0100c6a:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
f0100c6d:	8d 04 85 74 21 10 f0 	lea    -0xfefde8c(,%eax,4),%eax
f0100c74:	83 c4 10             	add    $0x10,%esp
f0100c77:	eb 22                	jmp    f0100c9b <debuginfo_eip+0x141>
f0100c79:	83 ec 04             	sub    $0x4,%esp
f0100c7c:	68 42 1f 10 f0       	push   $0xf0101f42
f0100c81:	6a 7f                	push   $0x7f
f0100c83:	68 4f 1f 10 f0       	push   $0xf0101f4f
f0100c88:	e8 fe f3 ff ff       	call   f010008b <_panic>
f0100c8d:	89 7e 10             	mov    %edi,0x10(%esi)
f0100c90:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
f0100c93:	eb bf                	jmp    f0100c54 <debuginfo_eip+0xfa>
f0100c95:	83 eb 01             	sub    $0x1,%ebx
f0100c98:	83 e8 0c             	sub    $0xc,%eax
f0100c9b:	39 df                	cmp    %ebx,%edi
f0100c9d:	7f 33                	jg     f0100cd2 <debuginfo_eip+0x178>
f0100c9f:	0f b6 10             	movzbl (%eax),%edx
f0100ca2:	80 fa 84             	cmp    $0x84,%dl
f0100ca5:	74 0b                	je     f0100cb2 <debuginfo_eip+0x158>
f0100ca7:	80 fa 64             	cmp    $0x64,%dl
f0100caa:	75 e9                	jne    f0100c95 <debuginfo_eip+0x13b>
f0100cac:	83 78 04 00          	cmpl   $0x0,0x4(%eax)
f0100cb0:	74 e3                	je     f0100c95 <debuginfo_eip+0x13b>
f0100cb2:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
f0100cb5:	8b 14 85 70 21 10 f0 	mov    -0xfefde90(,%eax,4),%edx
f0100cbc:	b8 71 21 10 f0       	mov    $0xf0102171,%eax
f0100cc1:	2d 71 21 10 f0       	sub    $0xf0102171,%eax
f0100cc6:	39 c2                	cmp    %eax,%edx
f0100cc8:	73 08                	jae    f0100cd2 <debuginfo_eip+0x178>
f0100cca:	81 c2 71 21 10 f0    	add    $0xf0102171,%edx
f0100cd0:	89 16                	mov    %edx,(%esi)
f0100cd2:	8b 5d dc             	mov    -0x24(%ebp),%ebx
f0100cd5:	8b 4d d8             	mov    -0x28(%ebp),%ecx
f0100cd8:	b8 00 00 00 00       	mov    $0x0,%eax
f0100cdd:	39 cb                	cmp    %ecx,%ebx
f0100cdf:	7d 44                	jge    f0100d25 <debuginfo_eip+0x1cb>
f0100ce1:	8d 53 01             	lea    0x1(%ebx),%edx
f0100ce4:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
f0100ce7:	8d 04 85 80 21 10 f0 	lea    -0xfefde80(,%eax,4),%eax
f0100cee:	eb 07                	jmp    f0100cf7 <debuginfo_eip+0x19d>
f0100cf0:	83 46 14 01          	addl   $0x1,0x14(%esi)
f0100cf4:	83 c2 01             	add    $0x1,%edx
f0100cf7:	39 d1                	cmp    %edx,%ecx
f0100cf9:	74 25                	je     f0100d20 <debuginfo_eip+0x1c6>
f0100cfb:	83 c0 0c             	add    $0xc,%eax
f0100cfe:	80 78 f4 a0          	cmpb   $0xa0,-0xc(%eax)
f0100d02:	74 ec                	je     f0100cf0 <debuginfo_eip+0x196>
f0100d04:	b8 00 00 00 00       	mov    $0x0,%eax
f0100d09:	eb 1a                	jmp    f0100d25 <debuginfo_eip+0x1cb>
f0100d0b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
f0100d10:	eb 13                	jmp    f0100d25 <debuginfo_eip+0x1cb>
f0100d12:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
f0100d17:	eb 0c                	jmp    f0100d25 <debuginfo_eip+0x1cb>
f0100d19:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
f0100d1e:	eb 05                	jmp    f0100d25 <debuginfo_eip+0x1cb>
f0100d20:	b8 00 00 00 00       	mov    $0x0,%eax
f0100d25:	8d 65 f4             	lea    -0xc(%ebp),%esp
f0100d28:	5b                   	pop    %ebx
f0100d29:	5e                   	pop    %esi
f0100d2a:	5f                   	pop    %edi
f0100d2b:	5d                   	pop    %ebp
f0100d2c:	c3                   	ret    

f0100d2d <printnum>:
f0100d2d:	55                   	push   %ebp
f0100d2e:	89 e5                	mov    %esp,%ebp
f0100d30:	57                   	push   %edi
f0100d31:	56                   	push   %esi
f0100d32:	53                   	push   %ebx
f0100d33:	83 ec 1c             	sub    $0x1c,%esp
f0100d36:	89 c7                	mov    %eax,%edi
f0100d38:	89 d6                	mov    %edx,%esi
f0100d3a:	8b 45 08             	mov    0x8(%ebp),%eax
f0100d3d:	8b 55 0c             	mov    0xc(%ebp),%edx
f0100d40:	89 45 d8             	mov    %eax,-0x28(%ebp)
f0100d43:	89 55 dc             	mov    %edx,-0x24(%ebp)
f0100d46:	8b 4d 10             	mov    0x10(%ebp),%ecx
f0100d49:	bb 00 00 00 00       	mov    $0x0,%ebx
f0100d4e:	89 4d e0             	mov    %ecx,-0x20(%ebp)
f0100d51:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
f0100d54:	39 d3                	cmp    %edx,%ebx
f0100d56:	72 05                	jb     f0100d5d <printnum+0x30>
f0100d58:	39 45 10             	cmp    %eax,0x10(%ebp)
f0100d5b:	77 7a                	ja     f0100dd7 <printnum+0xaa>
f0100d5d:	83 ec 0c             	sub    $0xc,%esp
f0100d60:	ff 75 18             	pushl  0x18(%ebp)
f0100d63:	8b 45 14             	mov    0x14(%ebp),%eax
f0100d66:	8d 58 ff             	lea    -0x1(%eax),%ebx
f0100d69:	53                   	push   %ebx
f0100d6a:	ff 75 10             	pushl  0x10(%ebp)
f0100d6d:	83 ec 08             	sub    $0x8,%esp
f0100d70:	ff 75 e4             	pushl  -0x1c(%ebp)
f0100d73:	ff 75 e0             	pushl  -0x20(%ebp)
f0100d76:	ff 75 dc             	pushl  -0x24(%ebp)
f0100d79:	ff 75 d8             	pushl  -0x28(%ebp)
f0100d7c:	e8 df 09 00 00       	call   f0101760 <__udivdi3>
f0100d81:	83 c4 18             	add    $0x18,%esp
f0100d84:	52                   	push   %edx
f0100d85:	50                   	push   %eax
f0100d86:	89 f2                	mov    %esi,%edx
f0100d88:	89 f8                	mov    %edi,%eax
f0100d8a:	e8 9e ff ff ff       	call   f0100d2d <printnum>
f0100d8f:	83 c4 20             	add    $0x20,%esp
f0100d92:	eb 13                	jmp    f0100da7 <printnum+0x7a>
f0100d94:	83 ec 08             	sub    $0x8,%esp
f0100d97:	56                   	push   %esi
f0100d98:	ff 75 18             	pushl  0x18(%ebp)
f0100d9b:	ff d7                	call   *%edi
f0100d9d:	83 c4 10             	add    $0x10,%esp
f0100da0:	83 eb 01             	sub    $0x1,%ebx
f0100da3:	85 db                	test   %ebx,%ebx
f0100da5:	7f ed                	jg     f0100d94 <printnum+0x67>
f0100da7:	83 ec 08             	sub    $0x8,%esp
f0100daa:	56                   	push   %esi
f0100dab:	83 ec 04             	sub    $0x4,%esp
f0100dae:	ff 75 e4             	pushl  -0x1c(%ebp)
f0100db1:	ff 75 e0             	pushl  -0x20(%ebp)
f0100db4:	ff 75 dc             	pushl  -0x24(%ebp)
f0100db7:	ff 75 d8             	pushl  -0x28(%ebp)
f0100dba:	e8 c1 0a 00 00       	call   f0101880 <__umoddi3>
f0100dbf:	83 c4 14             	add    $0x14,%esp
f0100dc2:	0f be 80 5d 1f 10 f0 	movsbl -0xfefe0a3(%eax),%eax
f0100dc9:	50                   	push   %eax
f0100dca:	ff d7                	call   *%edi
f0100dcc:	83 c4 10             	add    $0x10,%esp
f0100dcf:	8d 65 f4             	lea    -0xc(%ebp),%esp
f0100dd2:	5b                   	pop    %ebx
f0100dd3:	5e                   	pop    %esi
f0100dd4:	5f                   	pop    %edi
f0100dd5:	5d                   	pop    %ebp
f0100dd6:	c3                   	ret    
f0100dd7:	8b 5d 14             	mov    0x14(%ebp),%ebx
f0100dda:	eb c4                	jmp    f0100da0 <printnum+0x73>

f0100ddc <sprintputch>:
f0100ddc:	55                   	push   %ebp
f0100ddd:	89 e5                	mov    %esp,%ebp
f0100ddf:	8b 45 0c             	mov    0xc(%ebp),%eax
f0100de2:	83 40 08 01          	addl   $0x1,0x8(%eax)
f0100de6:	8b 10                	mov    (%eax),%edx
f0100de8:	3b 50 04             	cmp    0x4(%eax),%edx
f0100deb:	73 0a                	jae    f0100df7 <sprintputch+0x1b>
f0100ded:	8d 4a 01             	lea    0x1(%edx),%ecx
f0100df0:	89 08                	mov    %ecx,(%eax)
f0100df2:	8b 45 08             	mov    0x8(%ebp),%eax
f0100df5:	88 02                	mov    %al,(%edx)
f0100df7:	5d                   	pop    %ebp
f0100df8:	c3                   	ret    

f0100df9 <printfmt>:
f0100df9:	55                   	push   %ebp
f0100dfa:	89 e5                	mov    %esp,%ebp
f0100dfc:	83 ec 08             	sub    $0x8,%esp
f0100dff:	8d 45 14             	lea    0x14(%ebp),%eax
f0100e02:	50                   	push   %eax
f0100e03:	ff 75 10             	pushl  0x10(%ebp)
f0100e06:	ff 75 0c             	pushl  0xc(%ebp)
f0100e09:	ff 75 08             	pushl  0x8(%ebp)
f0100e0c:	e8 05 00 00 00       	call   f0100e16 <vprintfmt>
f0100e11:	83 c4 10             	add    $0x10,%esp
f0100e14:	c9                   	leave  
f0100e15:	c3                   	ret    

f0100e16 <vprintfmt>:
f0100e16:	55                   	push   %ebp
f0100e17:	89 e5                	mov    %esp,%ebp
f0100e19:	57                   	push   %edi
f0100e1a:	56                   	push   %esi
f0100e1b:	53                   	push   %ebx
f0100e1c:	83 ec 2c             	sub    $0x2c,%esp
f0100e1f:	8b 75 08             	mov    0x8(%ebp),%esi
f0100e22:	8b 5d 0c             	mov    0xc(%ebp),%ebx
f0100e25:	8b 7d 10             	mov    0x10(%ebp),%edi
f0100e28:	e9 c1 03 00 00       	jmp    f01011ee <vprintfmt+0x3d8>
f0100e2d:	c6 45 d4 20          	movb   $0x20,-0x2c(%ebp)
f0100e31:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
f0100e38:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
f0100e3f:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
f0100e46:	b9 00 00 00 00       	mov    $0x0,%ecx
f0100e4b:	8d 47 01             	lea    0x1(%edi),%eax
f0100e4e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
f0100e51:	0f b6 17             	movzbl (%edi),%edx
f0100e54:	8d 42 dd             	lea    -0x23(%edx),%eax
f0100e57:	3c 55                	cmp    $0x55,%al
f0100e59:	0f 87 12 04 00 00    	ja     f0101271 <vprintfmt+0x45b>
f0100e5f:	0f b6 c0             	movzbl %al,%eax
f0100e62:	ff 24 85 ec 1f 10 f0 	jmp    *-0xfefe014(,%eax,4)
f0100e69:	8b 7d e4             	mov    -0x1c(%ebp),%edi
f0100e6c:	c6 45 d4 2d          	movb   $0x2d,-0x2c(%ebp)
f0100e70:	eb d9                	jmp    f0100e4b <vprintfmt+0x35>
f0100e72:	8b 7d e4             	mov    -0x1c(%ebp),%edi
f0100e75:	c6 45 d4 30          	movb   $0x30,-0x2c(%ebp)
f0100e79:	eb d0                	jmp    f0100e4b <vprintfmt+0x35>
f0100e7b:	0f b6 d2             	movzbl %dl,%edx
f0100e7e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
f0100e81:	b8 00 00 00 00       	mov    $0x0,%eax
f0100e86:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
f0100e89:	8d 04 80             	lea    (%eax,%eax,4),%eax
f0100e8c:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
f0100e90:	0f be 17             	movsbl (%edi),%edx
f0100e93:	8d 4a d0             	lea    -0x30(%edx),%ecx
f0100e96:	83 f9 09             	cmp    $0x9,%ecx
f0100e99:	77 55                	ja     f0100ef0 <vprintfmt+0xda>
f0100e9b:	83 c7 01             	add    $0x1,%edi
f0100e9e:	eb e9                	jmp    f0100e89 <vprintfmt+0x73>
f0100ea0:	8b 45 14             	mov    0x14(%ebp),%eax
f0100ea3:	8b 00                	mov    (%eax),%eax
f0100ea5:	89 45 d0             	mov    %eax,-0x30(%ebp)
f0100ea8:	8b 45 14             	mov    0x14(%ebp),%eax
f0100eab:	8d 40 04             	lea    0x4(%eax),%eax
f0100eae:	89 45 14             	mov    %eax,0x14(%ebp)
f0100eb1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
f0100eb4:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
f0100eb8:	79 91                	jns    f0100e4b <vprintfmt+0x35>
f0100eba:	8b 45 d0             	mov    -0x30(%ebp),%eax
f0100ebd:	89 45 e0             	mov    %eax,-0x20(%ebp)
f0100ec0:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
f0100ec7:	eb 82                	jmp    f0100e4b <vprintfmt+0x35>
f0100ec9:	8b 45 e0             	mov    -0x20(%ebp),%eax
f0100ecc:	85 c0                	test   %eax,%eax
f0100ece:	ba 00 00 00 00       	mov    $0x0,%edx
f0100ed3:	0f 49 d0             	cmovns %eax,%edx
f0100ed6:	89 55 e0             	mov    %edx,-0x20(%ebp)
f0100ed9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
f0100edc:	e9 6a ff ff ff       	jmp    f0100e4b <vprintfmt+0x35>
f0100ee1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
f0100ee4:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
f0100eeb:	e9 5b ff ff ff       	jmp    f0100e4b <vprintfmt+0x35>
f0100ef0:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
f0100ef3:	89 45 d0             	mov    %eax,-0x30(%ebp)
f0100ef6:	eb bc                	jmp    f0100eb4 <vprintfmt+0x9e>
f0100ef8:	83 c1 01             	add    $0x1,%ecx
f0100efb:	8b 7d e4             	mov    -0x1c(%ebp),%edi
f0100efe:	e9 48 ff ff ff       	jmp    f0100e4b <vprintfmt+0x35>
f0100f03:	8b 45 14             	mov    0x14(%ebp),%eax
f0100f06:	8d 78 04             	lea    0x4(%eax),%edi
f0100f09:	83 ec 08             	sub    $0x8,%esp
f0100f0c:	53                   	push   %ebx
f0100f0d:	ff 30                	pushl  (%eax)
f0100f0f:	ff d6                	call   *%esi
f0100f11:	83 c4 10             	add    $0x10,%esp
f0100f14:	89 7d 14             	mov    %edi,0x14(%ebp)
f0100f17:	e9 cf 02 00 00       	jmp    f01011eb <vprintfmt+0x3d5>
f0100f1c:	8b 45 14             	mov    0x14(%ebp),%eax
f0100f1f:	8d 78 04             	lea    0x4(%eax),%edi
f0100f22:	8b 00                	mov    (%eax),%eax
f0100f24:	99                   	cltd   
f0100f25:	31 d0                	xor    %edx,%eax
f0100f27:	29 d0                	sub    %edx,%eax
f0100f29:	83 f8 06             	cmp    $0x6,%eax
f0100f2c:	7f 23                	jg     f0100f51 <vprintfmt+0x13b>
f0100f2e:	8b 14 85 44 21 10 f0 	mov    -0xfefdebc(,%eax,4),%edx
f0100f35:	85 d2                	test   %edx,%edx
f0100f37:	74 18                	je     f0100f51 <vprintfmt+0x13b>
f0100f39:	52                   	push   %edx
f0100f3a:	68 7e 1f 10 f0       	push   $0xf0101f7e
f0100f3f:	53                   	push   %ebx
f0100f40:	56                   	push   %esi
f0100f41:	e8 b3 fe ff ff       	call   f0100df9 <printfmt>
f0100f46:	83 c4 10             	add    $0x10,%esp
f0100f49:	89 7d 14             	mov    %edi,0x14(%ebp)
f0100f4c:	e9 9a 02 00 00       	jmp    f01011eb <vprintfmt+0x3d5>
f0100f51:	50                   	push   %eax
f0100f52:	68 75 1f 10 f0       	push   $0xf0101f75
f0100f57:	53                   	push   %ebx
f0100f58:	56                   	push   %esi
f0100f59:	e8 9b fe ff ff       	call   f0100df9 <printfmt>
f0100f5e:	83 c4 10             	add    $0x10,%esp
f0100f61:	89 7d 14             	mov    %edi,0x14(%ebp)
f0100f64:	e9 82 02 00 00       	jmp    f01011eb <vprintfmt+0x3d5>
f0100f69:	8b 45 14             	mov    0x14(%ebp),%eax
f0100f6c:	83 c0 04             	add    $0x4,%eax
f0100f6f:	89 45 cc             	mov    %eax,-0x34(%ebp)
f0100f72:	8b 45 14             	mov    0x14(%ebp),%eax
f0100f75:	8b 38                	mov    (%eax),%edi
f0100f77:	85 ff                	test   %edi,%edi
f0100f79:	b8 6e 1f 10 f0       	mov    $0xf0101f6e,%eax
f0100f7e:	0f 44 f8             	cmove  %eax,%edi
f0100f81:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
f0100f85:	0f 8e bd 00 00 00    	jle    f0101048 <vprintfmt+0x232>
f0100f8b:	80 7d d4 2d          	cmpb   $0x2d,-0x2c(%ebp)
f0100f8f:	75 0e                	jne    f0100f9f <vprintfmt+0x189>
f0100f91:	89 75 08             	mov    %esi,0x8(%ebp)
f0100f94:	8b 75 d0             	mov    -0x30(%ebp),%esi
f0100f97:	89 5d 0c             	mov    %ebx,0xc(%ebp)
f0100f9a:	8b 5d e0             	mov    -0x20(%ebp),%ebx
f0100f9d:	eb 6d                	jmp    f010100c <vprintfmt+0x1f6>
f0100f9f:	83 ec 08             	sub    $0x8,%esp
f0100fa2:	ff 75 d0             	pushl  -0x30(%ebp)
f0100fa5:	57                   	push   %edi
f0100fa6:	e8 50 04 00 00       	call   f01013fb <strnlen>
f0100fab:	8b 4d e0             	mov    -0x20(%ebp),%ecx
f0100fae:	29 c1                	sub    %eax,%ecx
f0100fb0:	89 4d c8             	mov    %ecx,-0x38(%ebp)
f0100fb3:	83 c4 10             	add    $0x10,%esp
f0100fb6:	0f be 45 d4          	movsbl -0x2c(%ebp),%eax
f0100fba:	89 45 e0             	mov    %eax,-0x20(%ebp)
f0100fbd:	89 7d d4             	mov    %edi,-0x2c(%ebp)
f0100fc0:	89 cf                	mov    %ecx,%edi
f0100fc2:	eb 0f                	jmp    f0100fd3 <vprintfmt+0x1bd>
f0100fc4:	83 ec 08             	sub    $0x8,%esp
f0100fc7:	53                   	push   %ebx
f0100fc8:	ff 75 e0             	pushl  -0x20(%ebp)
f0100fcb:	ff d6                	call   *%esi
f0100fcd:	83 ef 01             	sub    $0x1,%edi
f0100fd0:	83 c4 10             	add    $0x10,%esp
f0100fd3:	85 ff                	test   %edi,%edi
f0100fd5:	7f ed                	jg     f0100fc4 <vprintfmt+0x1ae>
f0100fd7:	8b 7d d4             	mov    -0x2c(%ebp),%edi
f0100fda:	8b 4d c8             	mov    -0x38(%ebp),%ecx
f0100fdd:	85 c9                	test   %ecx,%ecx
f0100fdf:	b8 00 00 00 00       	mov    $0x0,%eax
f0100fe4:	0f 49 c1             	cmovns %ecx,%eax
f0100fe7:	29 c1                	sub    %eax,%ecx
f0100fe9:	89 75 08             	mov    %esi,0x8(%ebp)
f0100fec:	8b 75 d0             	mov    -0x30(%ebp),%esi
f0100fef:	89 5d 0c             	mov    %ebx,0xc(%ebp)
f0100ff2:	89 cb                	mov    %ecx,%ebx
f0100ff4:	eb 16                	jmp    f010100c <vprintfmt+0x1f6>
f0100ff6:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
f0100ffa:	75 31                	jne    f010102d <vprintfmt+0x217>
f0100ffc:	83 ec 08             	sub    $0x8,%esp
f0100fff:	ff 75 0c             	pushl  0xc(%ebp)
f0101002:	50                   	push   %eax
f0101003:	ff 55 08             	call   *0x8(%ebp)
f0101006:	83 c4 10             	add    $0x10,%esp
f0101009:	83 eb 01             	sub    $0x1,%ebx
f010100c:	83 c7 01             	add    $0x1,%edi
f010100f:	0f b6 57 ff          	movzbl -0x1(%edi),%edx
f0101013:	0f be c2             	movsbl %dl,%eax
f0101016:	85 c0                	test   %eax,%eax
f0101018:	74 59                	je     f0101073 <vprintfmt+0x25d>
f010101a:	85 f6                	test   %esi,%esi
f010101c:	78 d8                	js     f0100ff6 <vprintfmt+0x1e0>
f010101e:	83 ee 01             	sub    $0x1,%esi
f0101021:	79 d3                	jns    f0100ff6 <vprintfmt+0x1e0>
f0101023:	89 df                	mov    %ebx,%edi
f0101025:	8b 75 08             	mov    0x8(%ebp),%esi
f0101028:	8b 5d 0c             	mov    0xc(%ebp),%ebx
f010102b:	eb 37                	jmp    f0101064 <vprintfmt+0x24e>
f010102d:	0f be d2             	movsbl %dl,%edx
f0101030:	83 ea 20             	sub    $0x20,%edx
f0101033:	83 fa 5e             	cmp    $0x5e,%edx
f0101036:	76 c4                	jbe    f0100ffc <vprintfmt+0x1e6>
f0101038:	83 ec 08             	sub    $0x8,%esp
f010103b:	ff 75 0c             	pushl  0xc(%ebp)
f010103e:	6a 3f                	push   $0x3f
f0101040:	ff 55 08             	call   *0x8(%ebp)
f0101043:	83 c4 10             	add    $0x10,%esp
f0101046:	eb c1                	jmp    f0101009 <vprintfmt+0x1f3>
f0101048:	89 75 08             	mov    %esi,0x8(%ebp)
f010104b:	8b 75 d0             	mov    -0x30(%ebp),%esi
f010104e:	89 5d 0c             	mov    %ebx,0xc(%ebp)
f0101051:	8b 5d e0             	mov    -0x20(%ebp),%ebx
f0101054:	eb b6                	jmp    f010100c <vprintfmt+0x1f6>
f0101056:	83 ec 08             	sub    $0x8,%esp
f0101059:	53                   	push   %ebx
f010105a:	6a 20                	push   $0x20
f010105c:	ff d6                	call   *%esi
f010105e:	83 ef 01             	sub    $0x1,%edi
f0101061:	83 c4 10             	add    $0x10,%esp
f0101064:	85 ff                	test   %edi,%edi
f0101066:	7f ee                	jg     f0101056 <vprintfmt+0x240>
f0101068:	8b 45 cc             	mov    -0x34(%ebp),%eax
f010106b:	89 45 14             	mov    %eax,0x14(%ebp)
f010106e:	e9 78 01 00 00       	jmp    f01011eb <vprintfmt+0x3d5>
f0101073:	89 df                	mov    %ebx,%edi
f0101075:	8b 75 08             	mov    0x8(%ebp),%esi
f0101078:	8b 5d 0c             	mov    0xc(%ebp),%ebx
f010107b:	eb e7                	jmp    f0101064 <vprintfmt+0x24e>
f010107d:	83 f9 01             	cmp    $0x1,%ecx
f0101080:	7e 3f                	jle    f01010c1 <vprintfmt+0x2ab>
f0101082:	8b 45 14             	mov    0x14(%ebp),%eax
f0101085:	8b 50 04             	mov    0x4(%eax),%edx
f0101088:	8b 00                	mov    (%eax),%eax
f010108a:	89 45 d8             	mov    %eax,-0x28(%ebp)
f010108d:	89 55 dc             	mov    %edx,-0x24(%ebp)
f0101090:	8b 45 14             	mov    0x14(%ebp),%eax
f0101093:	8d 40 08             	lea    0x8(%eax),%eax
f0101096:	89 45 14             	mov    %eax,0x14(%ebp)
f0101099:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
f010109d:	79 5c                	jns    f01010fb <vprintfmt+0x2e5>
f010109f:	83 ec 08             	sub    $0x8,%esp
f01010a2:	53                   	push   %ebx
f01010a3:	6a 2d                	push   $0x2d
f01010a5:	ff d6                	call   *%esi
f01010a7:	8b 55 d8             	mov    -0x28(%ebp),%edx
f01010aa:	8b 4d dc             	mov    -0x24(%ebp),%ecx
f01010ad:	f7 da                	neg    %edx
f01010af:	83 d1 00             	adc    $0x0,%ecx
f01010b2:	f7 d9                	neg    %ecx
f01010b4:	83 c4 10             	add    $0x10,%esp
f01010b7:	b8 0a 00 00 00       	mov    $0xa,%eax
f01010bc:	e9 10 01 00 00       	jmp    f01011d1 <vprintfmt+0x3bb>
f01010c1:	85 c9                	test   %ecx,%ecx
f01010c3:	75 1b                	jne    f01010e0 <vprintfmt+0x2ca>
f01010c5:	8b 45 14             	mov    0x14(%ebp),%eax
f01010c8:	8b 00                	mov    (%eax),%eax
f01010ca:	89 45 d8             	mov    %eax,-0x28(%ebp)
f01010cd:	89 c1                	mov    %eax,%ecx
f01010cf:	c1 f9 1f             	sar    $0x1f,%ecx
f01010d2:	89 4d dc             	mov    %ecx,-0x24(%ebp)
f01010d5:	8b 45 14             	mov    0x14(%ebp),%eax
f01010d8:	8d 40 04             	lea    0x4(%eax),%eax
f01010db:	89 45 14             	mov    %eax,0x14(%ebp)
f01010de:	eb b9                	jmp    f0101099 <vprintfmt+0x283>
f01010e0:	8b 45 14             	mov    0x14(%ebp),%eax
f01010e3:	8b 00                	mov    (%eax),%eax
f01010e5:	89 45 d8             	mov    %eax,-0x28(%ebp)
f01010e8:	89 c1                	mov    %eax,%ecx
f01010ea:	c1 f9 1f             	sar    $0x1f,%ecx
f01010ed:	89 4d dc             	mov    %ecx,-0x24(%ebp)
f01010f0:	8b 45 14             	mov    0x14(%ebp),%eax
f01010f3:	8d 40 04             	lea    0x4(%eax),%eax
f01010f6:	89 45 14             	mov    %eax,0x14(%ebp)
f01010f9:	eb 9e                	jmp    f0101099 <vprintfmt+0x283>
f01010fb:	8b 55 d8             	mov    -0x28(%ebp),%edx
f01010fe:	8b 4d dc             	mov    -0x24(%ebp),%ecx
f0101101:	b8 0a 00 00 00       	mov    $0xa,%eax
f0101106:	e9 c6 00 00 00       	jmp    f01011d1 <vprintfmt+0x3bb>
f010110b:	83 f9 01             	cmp    $0x1,%ecx
f010110e:	7e 18                	jle    f0101128 <vprintfmt+0x312>
f0101110:	8b 45 14             	mov    0x14(%ebp),%eax
f0101113:	8b 10                	mov    (%eax),%edx
f0101115:	8b 48 04             	mov    0x4(%eax),%ecx
f0101118:	8d 40 08             	lea    0x8(%eax),%eax
f010111b:	89 45 14             	mov    %eax,0x14(%ebp)
f010111e:	b8 0a 00 00 00       	mov    $0xa,%eax
f0101123:	e9 a9 00 00 00       	jmp    f01011d1 <vprintfmt+0x3bb>
f0101128:	85 c9                	test   %ecx,%ecx
f010112a:	75 1a                	jne    f0101146 <vprintfmt+0x330>
f010112c:	8b 45 14             	mov    0x14(%ebp),%eax
f010112f:	8b 10                	mov    (%eax),%edx
f0101131:	b9 00 00 00 00       	mov    $0x0,%ecx
f0101136:	8d 40 04             	lea    0x4(%eax),%eax
f0101139:	89 45 14             	mov    %eax,0x14(%ebp)
f010113c:	b8 0a 00 00 00       	mov    $0xa,%eax
f0101141:	e9 8b 00 00 00       	jmp    f01011d1 <vprintfmt+0x3bb>
f0101146:	8b 45 14             	mov    0x14(%ebp),%eax
f0101149:	8b 10                	mov    (%eax),%edx
f010114b:	b9 00 00 00 00       	mov    $0x0,%ecx
f0101150:	8d 40 04             	lea    0x4(%eax),%eax
f0101153:	89 45 14             	mov    %eax,0x14(%ebp)
f0101156:	b8 0a 00 00 00       	mov    $0xa,%eax
f010115b:	eb 74                	jmp    f01011d1 <vprintfmt+0x3bb>
f010115d:	83 f9 01             	cmp    $0x1,%ecx
f0101160:	7e 15                	jle    f0101177 <vprintfmt+0x361>
f0101162:	8b 45 14             	mov    0x14(%ebp),%eax
f0101165:	8b 10                	mov    (%eax),%edx
f0101167:	8b 48 04             	mov    0x4(%eax),%ecx
f010116a:	8d 40 08             	lea    0x8(%eax),%eax
f010116d:	89 45 14             	mov    %eax,0x14(%ebp)
f0101170:	b8 08 00 00 00       	mov    $0x8,%eax
f0101175:	eb 5a                	jmp    f01011d1 <vprintfmt+0x3bb>
f0101177:	85 c9                	test   %ecx,%ecx
f0101179:	75 17                	jne    f0101192 <vprintfmt+0x37c>
f010117b:	8b 45 14             	mov    0x14(%ebp),%eax
f010117e:	8b 10                	mov    (%eax),%edx
f0101180:	b9 00 00 00 00       	mov    $0x0,%ecx
f0101185:	8d 40 04             	lea    0x4(%eax),%eax
f0101188:	89 45 14             	mov    %eax,0x14(%ebp)
f010118b:	b8 08 00 00 00       	mov    $0x8,%eax
f0101190:	eb 3f                	jmp    f01011d1 <vprintfmt+0x3bb>
f0101192:	8b 45 14             	mov    0x14(%ebp),%eax
f0101195:	8b 10                	mov    (%eax),%edx
f0101197:	b9 00 00 00 00       	mov    $0x0,%ecx
f010119c:	8d 40 04             	lea    0x4(%eax),%eax
f010119f:	89 45 14             	mov    %eax,0x14(%ebp)
f01011a2:	b8 08 00 00 00       	mov    $0x8,%eax
f01011a7:	eb 28                	jmp    f01011d1 <vprintfmt+0x3bb>
f01011a9:	83 ec 08             	sub    $0x8,%esp
f01011ac:	53                   	push   %ebx
f01011ad:	6a 30                	push   $0x30
f01011af:	ff d6                	call   *%esi
f01011b1:	83 c4 08             	add    $0x8,%esp
f01011b4:	53                   	push   %ebx
f01011b5:	6a 78                	push   $0x78
f01011b7:	ff d6                	call   *%esi
f01011b9:	8b 45 14             	mov    0x14(%ebp),%eax
f01011bc:	8b 10                	mov    (%eax),%edx
f01011be:	b9 00 00 00 00       	mov    $0x0,%ecx
f01011c3:	83 c4 10             	add    $0x10,%esp
f01011c6:	8d 40 04             	lea    0x4(%eax),%eax
f01011c9:	89 45 14             	mov    %eax,0x14(%ebp)
f01011cc:	b8 10 00 00 00       	mov    $0x10,%eax
f01011d1:	83 ec 0c             	sub    $0xc,%esp
f01011d4:	0f be 7d d4          	movsbl -0x2c(%ebp),%edi
f01011d8:	57                   	push   %edi
f01011d9:	ff 75 e0             	pushl  -0x20(%ebp)
f01011dc:	50                   	push   %eax
f01011dd:	51                   	push   %ecx
f01011de:	52                   	push   %edx
f01011df:	89 da                	mov    %ebx,%edx
f01011e1:	89 f0                	mov    %esi,%eax
f01011e3:	e8 45 fb ff ff       	call   f0100d2d <printnum>
f01011e8:	83 c4 20             	add    $0x20,%esp
f01011eb:	8b 7d e4             	mov    -0x1c(%ebp),%edi
f01011ee:	83 c7 01             	add    $0x1,%edi
f01011f1:	0f b6 47 ff          	movzbl -0x1(%edi),%eax
f01011f5:	83 f8 25             	cmp    $0x25,%eax
f01011f8:	0f 84 2f fc ff ff    	je     f0100e2d <vprintfmt+0x17>
f01011fe:	85 c0                	test   %eax,%eax
f0101200:	0f 84 8b 00 00 00    	je     f0101291 <vprintfmt+0x47b>
f0101206:	83 ec 08             	sub    $0x8,%esp
f0101209:	53                   	push   %ebx
f010120a:	50                   	push   %eax
f010120b:	ff d6                	call   *%esi
f010120d:	83 c4 10             	add    $0x10,%esp
f0101210:	eb dc                	jmp    f01011ee <vprintfmt+0x3d8>
f0101212:	83 f9 01             	cmp    $0x1,%ecx
f0101215:	7e 15                	jle    f010122c <vprintfmt+0x416>
f0101217:	8b 45 14             	mov    0x14(%ebp),%eax
f010121a:	8b 10                	mov    (%eax),%edx
f010121c:	8b 48 04             	mov    0x4(%eax),%ecx
f010121f:	8d 40 08             	lea    0x8(%eax),%eax
f0101222:	89 45 14             	mov    %eax,0x14(%ebp)
f0101225:	b8 10 00 00 00       	mov    $0x10,%eax
f010122a:	eb a5                	jmp    f01011d1 <vprintfmt+0x3bb>
f010122c:	85 c9                	test   %ecx,%ecx
f010122e:	75 17                	jne    f0101247 <vprintfmt+0x431>
f0101230:	8b 45 14             	mov    0x14(%ebp),%eax
f0101233:	8b 10                	mov    (%eax),%edx
f0101235:	b9 00 00 00 00       	mov    $0x0,%ecx
f010123a:	8d 40 04             	lea    0x4(%eax),%eax
f010123d:	89 45 14             	mov    %eax,0x14(%ebp)
f0101240:	b8 10 00 00 00       	mov    $0x10,%eax
f0101245:	eb 8a                	jmp    f01011d1 <vprintfmt+0x3bb>
f0101247:	8b 45 14             	mov    0x14(%ebp),%eax
f010124a:	8b 10                	mov    (%eax),%edx
f010124c:	b9 00 00 00 00       	mov    $0x0,%ecx
f0101251:	8d 40 04             	lea    0x4(%eax),%eax
f0101254:	89 45 14             	mov    %eax,0x14(%ebp)
f0101257:	b8 10 00 00 00       	mov    $0x10,%eax
f010125c:	e9 70 ff ff ff       	jmp    f01011d1 <vprintfmt+0x3bb>
f0101261:	83 ec 08             	sub    $0x8,%esp
f0101264:	53                   	push   %ebx
f0101265:	6a 25                	push   $0x25
f0101267:	ff d6                	call   *%esi
f0101269:	83 c4 10             	add    $0x10,%esp
f010126c:	e9 7a ff ff ff       	jmp    f01011eb <vprintfmt+0x3d5>
f0101271:	83 ec 08             	sub    $0x8,%esp
f0101274:	53                   	push   %ebx
f0101275:	6a 25                	push   $0x25
f0101277:	ff d6                	call   *%esi
f0101279:	83 c4 10             	add    $0x10,%esp
f010127c:	89 f8                	mov    %edi,%eax
f010127e:	eb 03                	jmp    f0101283 <vprintfmt+0x46d>
f0101280:	83 e8 01             	sub    $0x1,%eax
f0101283:	80 78 ff 25          	cmpb   $0x25,-0x1(%eax)
f0101287:	75 f7                	jne    f0101280 <vprintfmt+0x46a>
f0101289:	89 45 e4             	mov    %eax,-0x1c(%ebp)
f010128c:	e9 5a ff ff ff       	jmp    f01011eb <vprintfmt+0x3d5>
f0101291:	8d 65 f4             	lea    -0xc(%ebp),%esp
f0101294:	5b                   	pop    %ebx
f0101295:	5e                   	pop    %esi
f0101296:	5f                   	pop    %edi
f0101297:	5d                   	pop    %ebp
f0101298:	c3                   	ret    

f0101299 <vsnprintf>:
f0101299:	55                   	push   %ebp
f010129a:	89 e5                	mov    %esp,%ebp
f010129c:	83 ec 18             	sub    $0x18,%esp
f010129f:	8b 45 08             	mov    0x8(%ebp),%eax
f01012a2:	8b 55 0c             	mov    0xc(%ebp),%edx
f01012a5:	89 45 ec             	mov    %eax,-0x14(%ebp)
f01012a8:	8d 4c 10 ff          	lea    -0x1(%eax,%edx,1),%ecx
f01012ac:	89 4d f0             	mov    %ecx,-0x10(%ebp)
f01012af:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
f01012b6:	85 c0                	test   %eax,%eax
f01012b8:	74 26                	je     f01012e0 <vsnprintf+0x47>
f01012ba:	85 d2                	test   %edx,%edx
f01012bc:	7e 22                	jle    f01012e0 <vsnprintf+0x47>
f01012be:	ff 75 14             	pushl  0x14(%ebp)
f01012c1:	ff 75 10             	pushl  0x10(%ebp)
f01012c4:	8d 45 ec             	lea    -0x14(%ebp),%eax
f01012c7:	50                   	push   %eax
f01012c8:	68 dc 0d 10 f0       	push   $0xf0100ddc
f01012cd:	e8 44 fb ff ff       	call   f0100e16 <vprintfmt>
f01012d2:	8b 45 ec             	mov    -0x14(%ebp),%eax
f01012d5:	c6 00 00             	movb   $0x0,(%eax)
f01012d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
f01012db:	83 c4 10             	add    $0x10,%esp
f01012de:	c9                   	leave  
f01012df:	c3                   	ret    
f01012e0:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
f01012e5:	eb f7                	jmp    f01012de <vsnprintf+0x45>

f01012e7 <snprintf>:
f01012e7:	55                   	push   %ebp
f01012e8:	89 e5                	mov    %esp,%ebp
f01012ea:	83 ec 08             	sub    $0x8,%esp
f01012ed:	8d 45 14             	lea    0x14(%ebp),%eax
f01012f0:	50                   	push   %eax
f01012f1:	ff 75 10             	pushl  0x10(%ebp)
f01012f4:	ff 75 0c             	pushl  0xc(%ebp)
f01012f7:	ff 75 08             	pushl  0x8(%ebp)
f01012fa:	e8 9a ff ff ff       	call   f0101299 <vsnprintf>
f01012ff:	c9                   	leave  
f0101300:	c3                   	ret    

f0101301 <readline>:
f0101301:	55                   	push   %ebp
f0101302:	89 e5                	mov    %esp,%ebp
f0101304:	57                   	push   %edi
f0101305:	56                   	push   %esi
f0101306:	53                   	push   %ebx
f0101307:	83 ec 0c             	sub    $0xc,%esp
f010130a:	8b 45 08             	mov    0x8(%ebp),%eax
f010130d:	85 c0                	test   %eax,%eax
f010130f:	74 11                	je     f0101322 <readline+0x21>
f0101311:	83 ec 08             	sub    $0x8,%esp
f0101314:	50                   	push   %eax
f0101315:	68 7e 1f 10 f0       	push   $0xf0101f7e
f010131a:	e8 37 f7 ff ff       	call   f0100a56 <cprintf>
f010131f:	83 c4 10             	add    $0x10,%esp
f0101322:	83 ec 0c             	sub    $0xc,%esp
f0101325:	6a 00                	push   $0x0
f0101327:	e8 13 f3 ff ff       	call   f010063f <iscons>
f010132c:	89 c7                	mov    %eax,%edi
f010132e:	83 c4 10             	add    $0x10,%esp
f0101331:	be 00 00 00 00       	mov    $0x0,%esi
f0101336:	eb 3f                	jmp    f0101377 <readline+0x76>
f0101338:	83 ec 08             	sub    $0x8,%esp
f010133b:	50                   	push   %eax
f010133c:	68 60 21 10 f0       	push   $0xf0102160
f0101341:	e8 10 f7 ff ff       	call   f0100a56 <cprintf>
f0101346:	83 c4 10             	add    $0x10,%esp
f0101349:	b8 00 00 00 00       	mov    $0x0,%eax
f010134e:	8d 65 f4             	lea    -0xc(%ebp),%esp
f0101351:	5b                   	pop    %ebx
f0101352:	5e                   	pop    %esi
f0101353:	5f                   	pop    %edi
f0101354:	5d                   	pop    %ebp
f0101355:	c3                   	ret    
f0101356:	85 ff                	test   %edi,%edi
f0101358:	75 05                	jne    f010135f <readline+0x5e>
f010135a:	83 ee 01             	sub    $0x1,%esi
f010135d:	eb 18                	jmp    f0101377 <readline+0x76>
f010135f:	83 ec 0c             	sub    $0xc,%esp
f0101362:	6a 08                	push   $0x8
f0101364:	e8 b5 f2 ff ff       	call   f010061e <cputchar>
f0101369:	83 c4 10             	add    $0x10,%esp
f010136c:	eb ec                	jmp    f010135a <readline+0x59>
f010136e:	88 9e 40 d5 10 f0    	mov    %bl,-0xfef2ac0(%esi)
f0101374:	8d 76 01             	lea    0x1(%esi),%esi
f0101377:	e8 b2 f2 ff ff       	call   f010062e <getchar>
f010137c:	89 c3                	mov    %eax,%ebx
f010137e:	85 c0                	test   %eax,%eax
f0101380:	78 b6                	js     f0101338 <readline+0x37>
f0101382:	83 f8 08             	cmp    $0x8,%eax
f0101385:	0f 94 c2             	sete   %dl
f0101388:	83 f8 7f             	cmp    $0x7f,%eax
f010138b:	0f 94 c0             	sete   %al
f010138e:	08 c2                	or     %al,%dl
f0101390:	74 04                	je     f0101396 <readline+0x95>
f0101392:	85 f6                	test   %esi,%esi
f0101394:	7f c0                	jg     f0101356 <readline+0x55>
f0101396:	83 fb 1f             	cmp    $0x1f,%ebx
f0101399:	7e 1a                	jle    f01013b5 <readline+0xb4>
f010139b:	81 fe fe 03 00 00    	cmp    $0x3fe,%esi
f01013a1:	7f 12                	jg     f01013b5 <readline+0xb4>
f01013a3:	85 ff                	test   %edi,%edi
f01013a5:	74 c7                	je     f010136e <readline+0x6d>
f01013a7:	83 ec 0c             	sub    $0xc,%esp
f01013aa:	53                   	push   %ebx
f01013ab:	e8 6e f2 ff ff       	call   f010061e <cputchar>
f01013b0:	83 c4 10             	add    $0x10,%esp
f01013b3:	eb b9                	jmp    f010136e <readline+0x6d>
f01013b5:	83 fb 0a             	cmp    $0xa,%ebx
f01013b8:	74 05                	je     f01013bf <readline+0xbe>
f01013ba:	83 fb 0d             	cmp    $0xd,%ebx
f01013bd:	75 b8                	jne    f0101377 <readline+0x76>
f01013bf:	85 ff                	test   %edi,%edi
f01013c1:	75 11                	jne    f01013d4 <readline+0xd3>
f01013c3:	c6 86 40 d5 10 f0 00 	movb   $0x0,-0xfef2ac0(%esi)
f01013ca:	b8 40 d5 10 f0       	mov    $0xf010d540,%eax
f01013cf:	e9 7a ff ff ff       	jmp    f010134e <readline+0x4d>
f01013d4:	83 ec 0c             	sub    $0xc,%esp
f01013d7:	6a 0a                	push   $0xa
f01013d9:	e8 40 f2 ff ff       	call   f010061e <cputchar>
f01013de:	83 c4 10             	add    $0x10,%esp
f01013e1:	eb e0                	jmp    f01013c3 <readline+0xc2>

f01013e3 <strlen>:
f01013e3:	55                   	push   %ebp
f01013e4:	89 e5                	mov    %esp,%ebp
f01013e6:	8b 55 08             	mov    0x8(%ebp),%edx
f01013e9:	b8 00 00 00 00       	mov    $0x0,%eax
f01013ee:	eb 03                	jmp    f01013f3 <strlen+0x10>
f01013f0:	83 c0 01             	add    $0x1,%eax
f01013f3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
f01013f7:	75 f7                	jne    f01013f0 <strlen+0xd>
f01013f9:	5d                   	pop    %ebp
f01013fa:	c3                   	ret    

f01013fb <strnlen>:
f01013fb:	55                   	push   %ebp
f01013fc:	89 e5                	mov    %esp,%ebp
f01013fe:	8b 4d 08             	mov    0x8(%ebp),%ecx
f0101401:	8b 55 0c             	mov    0xc(%ebp),%edx
f0101404:	b8 00 00 00 00       	mov    $0x0,%eax
f0101409:	eb 03                	jmp    f010140e <strnlen+0x13>
f010140b:	83 c0 01             	add    $0x1,%eax
f010140e:	39 d0                	cmp    %edx,%eax
f0101410:	74 06                	je     f0101418 <strnlen+0x1d>
f0101412:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
f0101416:	75 f3                	jne    f010140b <strnlen+0x10>
f0101418:	5d                   	pop    %ebp
f0101419:	c3                   	ret    

f010141a <strcpy>:
f010141a:	55                   	push   %ebp
f010141b:	89 e5                	mov    %esp,%ebp
f010141d:	53                   	push   %ebx
f010141e:	8b 45 08             	mov    0x8(%ebp),%eax
f0101421:	8b 4d 0c             	mov    0xc(%ebp),%ecx
f0101424:	89 c2                	mov    %eax,%edx
f0101426:	83 c1 01             	add    $0x1,%ecx
f0101429:	83 c2 01             	add    $0x1,%edx
f010142c:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
f0101430:	88 5a ff             	mov    %bl,-0x1(%edx)
f0101433:	84 db                	test   %bl,%bl
f0101435:	75 ef                	jne    f0101426 <strcpy+0xc>
f0101437:	5b                   	pop    %ebx
f0101438:	5d                   	pop    %ebp
f0101439:	c3                   	ret    

f010143a <strcat>:
f010143a:	55                   	push   %ebp
f010143b:	89 e5                	mov    %esp,%ebp
f010143d:	53                   	push   %ebx
f010143e:	8b 5d 08             	mov    0x8(%ebp),%ebx
f0101441:	53                   	push   %ebx
f0101442:	e8 9c ff ff ff       	call   f01013e3 <strlen>
f0101447:	83 c4 04             	add    $0x4,%esp
f010144a:	ff 75 0c             	pushl  0xc(%ebp)
f010144d:	01 d8                	add    %ebx,%eax
f010144f:	50                   	push   %eax
f0101450:	e8 c5 ff ff ff       	call   f010141a <strcpy>
f0101455:	89 d8                	mov    %ebx,%eax
f0101457:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f010145a:	c9                   	leave  
f010145b:	c3                   	ret    

f010145c <strncpy>:
f010145c:	55                   	push   %ebp
f010145d:	89 e5                	mov    %esp,%ebp
f010145f:	56                   	push   %esi
f0101460:	53                   	push   %ebx
f0101461:	8b 75 08             	mov    0x8(%ebp),%esi
f0101464:	8b 4d 0c             	mov    0xc(%ebp),%ecx
f0101467:	89 f3                	mov    %esi,%ebx
f0101469:	03 5d 10             	add    0x10(%ebp),%ebx
f010146c:	89 f2                	mov    %esi,%edx
f010146e:	eb 0f                	jmp    f010147f <strncpy+0x23>
f0101470:	83 c2 01             	add    $0x1,%edx
f0101473:	0f b6 01             	movzbl (%ecx),%eax
f0101476:	88 42 ff             	mov    %al,-0x1(%edx)
f0101479:	80 39 01             	cmpb   $0x1,(%ecx)
f010147c:	83 d9 ff             	sbb    $0xffffffff,%ecx
f010147f:	39 da                	cmp    %ebx,%edx
f0101481:	75 ed                	jne    f0101470 <strncpy+0x14>
f0101483:	89 f0                	mov    %esi,%eax
f0101485:	5b                   	pop    %ebx
f0101486:	5e                   	pop    %esi
f0101487:	5d                   	pop    %ebp
f0101488:	c3                   	ret    

f0101489 <strlcpy>:
f0101489:	55                   	push   %ebp
f010148a:	89 e5                	mov    %esp,%ebp
f010148c:	56                   	push   %esi
f010148d:	53                   	push   %ebx
f010148e:	8b 75 08             	mov    0x8(%ebp),%esi
f0101491:	8b 55 0c             	mov    0xc(%ebp),%edx
f0101494:	8b 4d 10             	mov    0x10(%ebp),%ecx
f0101497:	89 f0                	mov    %esi,%eax
f0101499:	8d 5c 0e ff          	lea    -0x1(%esi,%ecx,1),%ebx
f010149d:	85 c9                	test   %ecx,%ecx
f010149f:	75 0b                	jne    f01014ac <strlcpy+0x23>
f01014a1:	eb 17                	jmp    f01014ba <strlcpy+0x31>
f01014a3:	83 c2 01             	add    $0x1,%edx
f01014a6:	83 c0 01             	add    $0x1,%eax
f01014a9:	88 48 ff             	mov    %cl,-0x1(%eax)
f01014ac:	39 d8                	cmp    %ebx,%eax
f01014ae:	74 07                	je     f01014b7 <strlcpy+0x2e>
f01014b0:	0f b6 0a             	movzbl (%edx),%ecx
f01014b3:	84 c9                	test   %cl,%cl
f01014b5:	75 ec                	jne    f01014a3 <strlcpy+0x1a>
f01014b7:	c6 00 00             	movb   $0x0,(%eax)
f01014ba:	29 f0                	sub    %esi,%eax
f01014bc:	5b                   	pop    %ebx
f01014bd:	5e                   	pop    %esi
f01014be:	5d                   	pop    %ebp
f01014bf:	c3                   	ret    

f01014c0 <strcmp>:
f01014c0:	55                   	push   %ebp
f01014c1:	89 e5                	mov    %esp,%ebp
f01014c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
f01014c6:	8b 55 0c             	mov    0xc(%ebp),%edx
f01014c9:	eb 06                	jmp    f01014d1 <strcmp+0x11>
f01014cb:	83 c1 01             	add    $0x1,%ecx
f01014ce:	83 c2 01             	add    $0x1,%edx
f01014d1:	0f b6 01             	movzbl (%ecx),%eax
f01014d4:	84 c0                	test   %al,%al
f01014d6:	74 04                	je     f01014dc <strcmp+0x1c>
f01014d8:	3a 02                	cmp    (%edx),%al
f01014da:	74 ef                	je     f01014cb <strcmp+0xb>
f01014dc:	0f b6 c0             	movzbl %al,%eax
f01014df:	0f b6 12             	movzbl (%edx),%edx
f01014e2:	29 d0                	sub    %edx,%eax
f01014e4:	5d                   	pop    %ebp
f01014e5:	c3                   	ret    

f01014e6 <strncmp>:
f01014e6:	55                   	push   %ebp
f01014e7:	89 e5                	mov    %esp,%ebp
f01014e9:	53                   	push   %ebx
f01014ea:	8b 45 08             	mov    0x8(%ebp),%eax
f01014ed:	8b 55 0c             	mov    0xc(%ebp),%edx
f01014f0:	89 c3                	mov    %eax,%ebx
f01014f2:	03 5d 10             	add    0x10(%ebp),%ebx
f01014f5:	eb 06                	jmp    f01014fd <strncmp+0x17>
f01014f7:	83 c0 01             	add    $0x1,%eax
f01014fa:	83 c2 01             	add    $0x1,%edx
f01014fd:	39 d8                	cmp    %ebx,%eax
f01014ff:	74 16                	je     f0101517 <strncmp+0x31>
f0101501:	0f b6 08             	movzbl (%eax),%ecx
f0101504:	84 c9                	test   %cl,%cl
f0101506:	74 04                	je     f010150c <strncmp+0x26>
f0101508:	3a 0a                	cmp    (%edx),%cl
f010150a:	74 eb                	je     f01014f7 <strncmp+0x11>
f010150c:	0f b6 00             	movzbl (%eax),%eax
f010150f:	0f b6 12             	movzbl (%edx),%edx
f0101512:	29 d0                	sub    %edx,%eax
f0101514:	5b                   	pop    %ebx
f0101515:	5d                   	pop    %ebp
f0101516:	c3                   	ret    
f0101517:	b8 00 00 00 00       	mov    $0x0,%eax
f010151c:	eb f6                	jmp    f0101514 <strncmp+0x2e>

f010151e <strchr>:
f010151e:	55                   	push   %ebp
f010151f:	89 e5                	mov    %esp,%ebp
f0101521:	8b 45 08             	mov    0x8(%ebp),%eax
f0101524:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
f0101528:	0f b6 10             	movzbl (%eax),%edx
f010152b:	84 d2                	test   %dl,%dl
f010152d:	74 09                	je     f0101538 <strchr+0x1a>
f010152f:	38 ca                	cmp    %cl,%dl
f0101531:	74 0a                	je     f010153d <strchr+0x1f>
f0101533:	83 c0 01             	add    $0x1,%eax
f0101536:	eb f0                	jmp    f0101528 <strchr+0xa>
f0101538:	b8 00 00 00 00       	mov    $0x0,%eax
f010153d:	5d                   	pop    %ebp
f010153e:	c3                   	ret    

f010153f <strfind>:
f010153f:	55                   	push   %ebp
f0101540:	89 e5                	mov    %esp,%ebp
f0101542:	8b 45 08             	mov    0x8(%ebp),%eax
f0101545:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
f0101549:	eb 03                	jmp    f010154e <strfind+0xf>
f010154b:	83 c0 01             	add    $0x1,%eax
f010154e:	0f b6 10             	movzbl (%eax),%edx
f0101551:	38 ca                	cmp    %cl,%dl
f0101553:	74 04                	je     f0101559 <strfind+0x1a>
f0101555:	84 d2                	test   %dl,%dl
f0101557:	75 f2                	jne    f010154b <strfind+0xc>
f0101559:	5d                   	pop    %ebp
f010155a:	c3                   	ret    

f010155b <memset>:
f010155b:	55                   	push   %ebp
f010155c:	89 e5                	mov    %esp,%ebp
f010155e:	57                   	push   %edi
f010155f:	56                   	push   %esi
f0101560:	53                   	push   %ebx
f0101561:	8b 7d 08             	mov    0x8(%ebp),%edi
f0101564:	8b 4d 10             	mov    0x10(%ebp),%ecx
f0101567:	85 c9                	test   %ecx,%ecx
f0101569:	74 13                	je     f010157e <memset+0x23>
f010156b:	f7 c7 03 00 00 00    	test   $0x3,%edi
f0101571:	75 05                	jne    f0101578 <memset+0x1d>
f0101573:	f6 c1 03             	test   $0x3,%cl
f0101576:	74 0d                	je     f0101585 <memset+0x2a>
f0101578:	8b 45 0c             	mov    0xc(%ebp),%eax
f010157b:	fc                   	cld    
f010157c:	f3 aa                	rep stos %al,%es:(%edi)
f010157e:	89 f8                	mov    %edi,%eax
f0101580:	5b                   	pop    %ebx
f0101581:	5e                   	pop    %esi
f0101582:	5f                   	pop    %edi
f0101583:	5d                   	pop    %ebp
f0101584:	c3                   	ret    
f0101585:	0f b6 55 0c          	movzbl 0xc(%ebp),%edx
f0101589:	89 d3                	mov    %edx,%ebx
f010158b:	c1 e3 08             	shl    $0x8,%ebx
f010158e:	89 d0                	mov    %edx,%eax
f0101590:	c1 e0 18             	shl    $0x18,%eax
f0101593:	89 d6                	mov    %edx,%esi
f0101595:	c1 e6 10             	shl    $0x10,%esi
f0101598:	09 f0                	or     %esi,%eax
f010159a:	09 c2                	or     %eax,%edx
f010159c:	09 da                	or     %ebx,%edx
f010159e:	c1 e9 02             	shr    $0x2,%ecx
f01015a1:	89 d0                	mov    %edx,%eax
f01015a3:	fc                   	cld    
f01015a4:	f3 ab                	rep stos %eax,%es:(%edi)
f01015a6:	eb d6                	jmp    f010157e <memset+0x23>

f01015a8 <memmove>:
f01015a8:	55                   	push   %ebp
f01015a9:	89 e5                	mov    %esp,%ebp
f01015ab:	57                   	push   %edi
f01015ac:	56                   	push   %esi
f01015ad:	8b 45 08             	mov    0x8(%ebp),%eax
f01015b0:	8b 75 0c             	mov    0xc(%ebp),%esi
f01015b3:	8b 4d 10             	mov    0x10(%ebp),%ecx
f01015b6:	39 c6                	cmp    %eax,%esi
f01015b8:	73 35                	jae    f01015ef <memmove+0x47>
f01015ba:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
f01015bd:	39 c2                	cmp    %eax,%edx
f01015bf:	76 2e                	jbe    f01015ef <memmove+0x47>
f01015c1:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
f01015c4:	89 d6                	mov    %edx,%esi
f01015c6:	09 fe                	or     %edi,%esi
f01015c8:	f7 c6 03 00 00 00    	test   $0x3,%esi
f01015ce:	74 0c                	je     f01015dc <memmove+0x34>
f01015d0:	83 ef 01             	sub    $0x1,%edi
f01015d3:	8d 72 ff             	lea    -0x1(%edx),%esi
f01015d6:	fd                   	std    
f01015d7:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
f01015d9:	fc                   	cld    
f01015da:	eb 21                	jmp    f01015fd <memmove+0x55>
f01015dc:	f6 c1 03             	test   $0x3,%cl
f01015df:	75 ef                	jne    f01015d0 <memmove+0x28>
f01015e1:	83 ef 04             	sub    $0x4,%edi
f01015e4:	8d 72 fc             	lea    -0x4(%edx),%esi
f01015e7:	c1 e9 02             	shr    $0x2,%ecx
f01015ea:	fd                   	std    
f01015eb:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
f01015ed:	eb ea                	jmp    f01015d9 <memmove+0x31>
f01015ef:	89 f2                	mov    %esi,%edx
f01015f1:	09 c2                	or     %eax,%edx
f01015f3:	f6 c2 03             	test   $0x3,%dl
f01015f6:	74 09                	je     f0101601 <memmove+0x59>
f01015f8:	89 c7                	mov    %eax,%edi
f01015fa:	fc                   	cld    
f01015fb:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
f01015fd:	5e                   	pop    %esi
f01015fe:	5f                   	pop    %edi
f01015ff:	5d                   	pop    %ebp
f0101600:	c3                   	ret    
f0101601:	f6 c1 03             	test   $0x3,%cl
f0101604:	75 f2                	jne    f01015f8 <memmove+0x50>
f0101606:	c1 e9 02             	shr    $0x2,%ecx
f0101609:	89 c7                	mov    %eax,%edi
f010160b:	fc                   	cld    
f010160c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
f010160e:	eb ed                	jmp    f01015fd <memmove+0x55>

f0101610 <memcpy>:
f0101610:	55                   	push   %ebp
f0101611:	89 e5                	mov    %esp,%ebp
f0101613:	ff 75 10             	pushl  0x10(%ebp)
f0101616:	ff 75 0c             	pushl  0xc(%ebp)
f0101619:	ff 75 08             	pushl  0x8(%ebp)
f010161c:	e8 87 ff ff ff       	call   f01015a8 <memmove>
f0101621:	c9                   	leave  
f0101622:	c3                   	ret    

f0101623 <memcmp>:
f0101623:	55                   	push   %ebp
f0101624:	89 e5                	mov    %esp,%ebp
f0101626:	56                   	push   %esi
f0101627:	53                   	push   %ebx
f0101628:	8b 45 08             	mov    0x8(%ebp),%eax
f010162b:	8b 55 0c             	mov    0xc(%ebp),%edx
f010162e:	89 c6                	mov    %eax,%esi
f0101630:	03 75 10             	add    0x10(%ebp),%esi
f0101633:	39 f0                	cmp    %esi,%eax
f0101635:	74 1c                	je     f0101653 <memcmp+0x30>
f0101637:	0f b6 08             	movzbl (%eax),%ecx
f010163a:	0f b6 1a             	movzbl (%edx),%ebx
f010163d:	38 d9                	cmp    %bl,%cl
f010163f:	75 08                	jne    f0101649 <memcmp+0x26>
f0101641:	83 c0 01             	add    $0x1,%eax
f0101644:	83 c2 01             	add    $0x1,%edx
f0101647:	eb ea                	jmp    f0101633 <memcmp+0x10>
f0101649:	0f b6 c1             	movzbl %cl,%eax
f010164c:	0f b6 db             	movzbl %bl,%ebx
f010164f:	29 d8                	sub    %ebx,%eax
f0101651:	eb 05                	jmp    f0101658 <memcmp+0x35>
f0101653:	b8 00 00 00 00       	mov    $0x0,%eax
f0101658:	5b                   	pop    %ebx
f0101659:	5e                   	pop    %esi
f010165a:	5d                   	pop    %ebp
f010165b:	c3                   	ret    

f010165c <memfind>:
f010165c:	55                   	push   %ebp
f010165d:	89 e5                	mov    %esp,%ebp
f010165f:	8b 45 08             	mov    0x8(%ebp),%eax
f0101662:	8b 4d 0c             	mov    0xc(%ebp),%ecx
f0101665:	89 c2                	mov    %eax,%edx
f0101667:	03 55 10             	add    0x10(%ebp),%edx
f010166a:	39 d0                	cmp    %edx,%eax
f010166c:	73 09                	jae    f0101677 <memfind+0x1b>
f010166e:	38 08                	cmp    %cl,(%eax)
f0101670:	74 05                	je     f0101677 <memfind+0x1b>
f0101672:	83 c0 01             	add    $0x1,%eax
f0101675:	eb f3                	jmp    f010166a <memfind+0xe>
f0101677:	5d                   	pop    %ebp
f0101678:	c3                   	ret    

f0101679 <strtol>:
f0101679:	55                   	push   %ebp
f010167a:	89 e5                	mov    %esp,%ebp
f010167c:	57                   	push   %edi
f010167d:	56                   	push   %esi
f010167e:	53                   	push   %ebx
f010167f:	8b 4d 08             	mov    0x8(%ebp),%ecx
f0101682:	8b 5d 10             	mov    0x10(%ebp),%ebx
f0101685:	eb 03                	jmp    f010168a <strtol+0x11>
f0101687:	83 c1 01             	add    $0x1,%ecx
f010168a:	0f b6 01             	movzbl (%ecx),%eax
f010168d:	3c 20                	cmp    $0x20,%al
f010168f:	74 f6                	je     f0101687 <strtol+0xe>
f0101691:	3c 09                	cmp    $0x9,%al
f0101693:	74 f2                	je     f0101687 <strtol+0xe>
f0101695:	3c 2b                	cmp    $0x2b,%al
f0101697:	74 2e                	je     f01016c7 <strtol+0x4e>
f0101699:	bf 00 00 00 00       	mov    $0x0,%edi
f010169e:	3c 2d                	cmp    $0x2d,%al
f01016a0:	74 2f                	je     f01016d1 <strtol+0x58>
f01016a2:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
f01016a8:	75 05                	jne    f01016af <strtol+0x36>
f01016aa:	80 39 30             	cmpb   $0x30,(%ecx)
f01016ad:	74 2c                	je     f01016db <strtol+0x62>
f01016af:	85 db                	test   %ebx,%ebx
f01016b1:	75 0a                	jne    f01016bd <strtol+0x44>
f01016b3:	bb 0a 00 00 00       	mov    $0xa,%ebx
f01016b8:	80 39 30             	cmpb   $0x30,(%ecx)
f01016bb:	74 28                	je     f01016e5 <strtol+0x6c>
f01016bd:	b8 00 00 00 00       	mov    $0x0,%eax
f01016c2:	89 5d 10             	mov    %ebx,0x10(%ebp)
f01016c5:	eb 50                	jmp    f0101717 <strtol+0x9e>
f01016c7:	83 c1 01             	add    $0x1,%ecx
f01016ca:	bf 00 00 00 00       	mov    $0x0,%edi
f01016cf:	eb d1                	jmp    f01016a2 <strtol+0x29>
f01016d1:	83 c1 01             	add    $0x1,%ecx
f01016d4:	bf 01 00 00 00       	mov    $0x1,%edi
f01016d9:	eb c7                	jmp    f01016a2 <strtol+0x29>
f01016db:	80 79 01 78          	cmpb   $0x78,0x1(%ecx)
f01016df:	74 0e                	je     f01016ef <strtol+0x76>
f01016e1:	85 db                	test   %ebx,%ebx
f01016e3:	75 d8                	jne    f01016bd <strtol+0x44>
f01016e5:	83 c1 01             	add    $0x1,%ecx
f01016e8:	bb 08 00 00 00       	mov    $0x8,%ebx
f01016ed:	eb ce                	jmp    f01016bd <strtol+0x44>
f01016ef:	83 c1 02             	add    $0x2,%ecx
f01016f2:	bb 10 00 00 00       	mov    $0x10,%ebx
f01016f7:	eb c4                	jmp    f01016bd <strtol+0x44>
f01016f9:	8d 72 9f             	lea    -0x61(%edx),%esi
f01016fc:	89 f3                	mov    %esi,%ebx
f01016fe:	80 fb 19             	cmp    $0x19,%bl
f0101701:	77 29                	ja     f010172c <strtol+0xb3>
f0101703:	0f be d2             	movsbl %dl,%edx
f0101706:	83 ea 57             	sub    $0x57,%edx
f0101709:	3b 55 10             	cmp    0x10(%ebp),%edx
f010170c:	7d 30                	jge    f010173e <strtol+0xc5>
f010170e:	83 c1 01             	add    $0x1,%ecx
f0101711:	0f af 45 10          	imul   0x10(%ebp),%eax
f0101715:	01 d0                	add    %edx,%eax
f0101717:	0f b6 11             	movzbl (%ecx),%edx
f010171a:	8d 72 d0             	lea    -0x30(%edx),%esi
f010171d:	89 f3                	mov    %esi,%ebx
f010171f:	80 fb 09             	cmp    $0x9,%bl
f0101722:	77 d5                	ja     f01016f9 <strtol+0x80>
f0101724:	0f be d2             	movsbl %dl,%edx
f0101727:	83 ea 30             	sub    $0x30,%edx
f010172a:	eb dd                	jmp    f0101709 <strtol+0x90>
f010172c:	8d 72 bf             	lea    -0x41(%edx),%esi
f010172f:	89 f3                	mov    %esi,%ebx
f0101731:	80 fb 19             	cmp    $0x19,%bl
f0101734:	77 08                	ja     f010173e <strtol+0xc5>
f0101736:	0f be d2             	movsbl %dl,%edx
f0101739:	83 ea 37             	sub    $0x37,%edx
f010173c:	eb cb                	jmp    f0101709 <strtol+0x90>
f010173e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
f0101742:	74 05                	je     f0101749 <strtol+0xd0>
f0101744:	8b 75 0c             	mov    0xc(%ebp),%esi
f0101747:	89 0e                	mov    %ecx,(%esi)
f0101749:	89 c2                	mov    %eax,%edx
f010174b:	f7 da                	neg    %edx
f010174d:	85 ff                	test   %edi,%edi
f010174f:	0f 45 c2             	cmovne %edx,%eax
f0101752:	5b                   	pop    %ebx
f0101753:	5e                   	pop    %esi
f0101754:	5f                   	pop    %edi
f0101755:	5d                   	pop    %ebp
f0101756:	c3                   	ret    
f0101757:	66 90                	xchg   %ax,%ax
f0101759:	66 90                	xchg   %ax,%ax
f010175b:	66 90                	xchg   %ax,%ax
f010175d:	66 90                	xchg   %ax,%ax
f010175f:	90                   	nop

f0101760 <__udivdi3>:
f0101760:	55                   	push   %ebp
f0101761:	57                   	push   %edi
f0101762:	56                   	push   %esi
f0101763:	53                   	push   %ebx
f0101764:	83 ec 1c             	sub    $0x1c,%esp
f0101767:	8b 54 24 3c          	mov    0x3c(%esp),%edx
f010176b:	8b 6c 24 30          	mov    0x30(%esp),%ebp
f010176f:	8b 74 24 34          	mov    0x34(%esp),%esi
f0101773:	8b 5c 24 38          	mov    0x38(%esp),%ebx
f0101777:	85 d2                	test   %edx,%edx
f0101779:	75 35                	jne    f01017b0 <__udivdi3+0x50>
f010177b:	39 f3                	cmp    %esi,%ebx
f010177d:	0f 87 bd 00 00 00    	ja     f0101840 <__udivdi3+0xe0>
f0101783:	85 db                	test   %ebx,%ebx
f0101785:	89 d9                	mov    %ebx,%ecx
f0101787:	75 0b                	jne    f0101794 <__udivdi3+0x34>
f0101789:	b8 01 00 00 00       	mov    $0x1,%eax
f010178e:	31 d2                	xor    %edx,%edx
f0101790:	f7 f3                	div    %ebx
f0101792:	89 c1                	mov    %eax,%ecx
f0101794:	31 d2                	xor    %edx,%edx
f0101796:	89 f0                	mov    %esi,%eax
f0101798:	f7 f1                	div    %ecx
f010179a:	89 c6                	mov    %eax,%esi
f010179c:	89 e8                	mov    %ebp,%eax
f010179e:	89 f7                	mov    %esi,%edi
f01017a0:	f7 f1                	div    %ecx
f01017a2:	89 fa                	mov    %edi,%edx
f01017a4:	83 c4 1c             	add    $0x1c,%esp
f01017a7:	5b                   	pop    %ebx
f01017a8:	5e                   	pop    %esi
f01017a9:	5f                   	pop    %edi
f01017aa:	5d                   	pop    %ebp
f01017ab:	c3                   	ret    
f01017ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f01017b0:	39 f2                	cmp    %esi,%edx
f01017b2:	77 7c                	ja     f0101830 <__udivdi3+0xd0>
f01017b4:	0f bd fa             	bsr    %edx,%edi
f01017b7:	83 f7 1f             	xor    $0x1f,%edi
f01017ba:	0f 84 98 00 00 00    	je     f0101858 <__udivdi3+0xf8>
f01017c0:	89 f9                	mov    %edi,%ecx
f01017c2:	b8 20 00 00 00       	mov    $0x20,%eax
f01017c7:	29 f8                	sub    %edi,%eax
f01017c9:	d3 e2                	shl    %cl,%edx
f01017cb:	89 54 24 08          	mov    %edx,0x8(%esp)
f01017cf:	89 c1                	mov    %eax,%ecx
f01017d1:	89 da                	mov    %ebx,%edx
f01017d3:	d3 ea                	shr    %cl,%edx
f01017d5:	8b 4c 24 08          	mov    0x8(%esp),%ecx
f01017d9:	09 d1                	or     %edx,%ecx
f01017db:	89 f2                	mov    %esi,%edx
f01017dd:	89 4c 24 08          	mov    %ecx,0x8(%esp)
f01017e1:	89 f9                	mov    %edi,%ecx
f01017e3:	d3 e3                	shl    %cl,%ebx
f01017e5:	89 c1                	mov    %eax,%ecx
f01017e7:	d3 ea                	shr    %cl,%edx
f01017e9:	89 f9                	mov    %edi,%ecx
f01017eb:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
f01017ef:	d3 e6                	shl    %cl,%esi
f01017f1:	89 eb                	mov    %ebp,%ebx
f01017f3:	89 c1                	mov    %eax,%ecx
f01017f5:	d3 eb                	shr    %cl,%ebx
f01017f7:	09 de                	or     %ebx,%esi
f01017f9:	89 f0                	mov    %esi,%eax
f01017fb:	f7 74 24 08          	divl   0x8(%esp)
f01017ff:	89 d6                	mov    %edx,%esi
f0101801:	89 c3                	mov    %eax,%ebx
f0101803:	f7 64 24 0c          	mull   0xc(%esp)
f0101807:	39 d6                	cmp    %edx,%esi
f0101809:	72 0c                	jb     f0101817 <__udivdi3+0xb7>
f010180b:	89 f9                	mov    %edi,%ecx
f010180d:	d3 e5                	shl    %cl,%ebp
f010180f:	39 c5                	cmp    %eax,%ebp
f0101811:	73 5d                	jae    f0101870 <__udivdi3+0x110>
f0101813:	39 d6                	cmp    %edx,%esi
f0101815:	75 59                	jne    f0101870 <__udivdi3+0x110>
f0101817:	8d 43 ff             	lea    -0x1(%ebx),%eax
f010181a:	31 ff                	xor    %edi,%edi
f010181c:	89 fa                	mov    %edi,%edx
f010181e:	83 c4 1c             	add    $0x1c,%esp
f0101821:	5b                   	pop    %ebx
f0101822:	5e                   	pop    %esi
f0101823:	5f                   	pop    %edi
f0101824:	5d                   	pop    %ebp
f0101825:	c3                   	ret    
f0101826:	8d 76 00             	lea    0x0(%esi),%esi
f0101829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
f0101830:	31 ff                	xor    %edi,%edi
f0101832:	31 c0                	xor    %eax,%eax
f0101834:	89 fa                	mov    %edi,%edx
f0101836:	83 c4 1c             	add    $0x1c,%esp
f0101839:	5b                   	pop    %ebx
f010183a:	5e                   	pop    %esi
f010183b:	5f                   	pop    %edi
f010183c:	5d                   	pop    %ebp
f010183d:	c3                   	ret    
f010183e:	66 90                	xchg   %ax,%ax
f0101840:	31 ff                	xor    %edi,%edi
f0101842:	89 e8                	mov    %ebp,%eax
f0101844:	89 f2                	mov    %esi,%edx
f0101846:	f7 f3                	div    %ebx
f0101848:	89 fa                	mov    %edi,%edx
f010184a:	83 c4 1c             	add    $0x1c,%esp
f010184d:	5b                   	pop    %ebx
f010184e:	5e                   	pop    %esi
f010184f:	5f                   	pop    %edi
f0101850:	5d                   	pop    %ebp
f0101851:	c3                   	ret    
f0101852:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
f0101858:	39 f2                	cmp    %esi,%edx
f010185a:	72 06                	jb     f0101862 <__udivdi3+0x102>
f010185c:	31 c0                	xor    %eax,%eax
f010185e:	39 eb                	cmp    %ebp,%ebx
f0101860:	77 d2                	ja     f0101834 <__udivdi3+0xd4>
f0101862:	b8 01 00 00 00       	mov    $0x1,%eax
f0101867:	eb cb                	jmp    f0101834 <__udivdi3+0xd4>
f0101869:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
f0101870:	89 d8                	mov    %ebx,%eax
f0101872:	31 ff                	xor    %edi,%edi
f0101874:	eb be                	jmp    f0101834 <__udivdi3+0xd4>
f0101876:	66 90                	xchg   %ax,%ax
f0101878:	66 90                	xchg   %ax,%ax
f010187a:	66 90                	xchg   %ax,%ax
f010187c:	66 90                	xchg   %ax,%ax
f010187e:	66 90                	xchg   %ax,%ax

f0101880 <__umoddi3>:
f0101880:	55                   	push   %ebp
f0101881:	57                   	push   %edi
f0101882:	56                   	push   %esi
f0101883:	53                   	push   %ebx
f0101884:	83 ec 1c             	sub    $0x1c,%esp
f0101887:	8b 6c 24 3c          	mov    0x3c(%esp),%ebp
f010188b:	8b 74 24 30          	mov    0x30(%esp),%esi
f010188f:	8b 5c 24 34          	mov    0x34(%esp),%ebx
f0101893:	8b 7c 24 38          	mov    0x38(%esp),%edi
f0101897:	85 ed                	test   %ebp,%ebp
f0101899:	89 f0                	mov    %esi,%eax
f010189b:	89 da                	mov    %ebx,%edx
f010189d:	75 19                	jne    f01018b8 <__umoddi3+0x38>
f010189f:	39 df                	cmp    %ebx,%edi
f01018a1:	0f 86 b1 00 00 00    	jbe    f0101958 <__umoddi3+0xd8>
f01018a7:	f7 f7                	div    %edi
f01018a9:	89 d0                	mov    %edx,%eax
f01018ab:	31 d2                	xor    %edx,%edx
f01018ad:	83 c4 1c             	add    $0x1c,%esp
f01018b0:	5b                   	pop    %ebx
f01018b1:	5e                   	pop    %esi
f01018b2:	5f                   	pop    %edi
f01018b3:	5d                   	pop    %ebp
f01018b4:	c3                   	ret    
f01018b5:	8d 76 00             	lea    0x0(%esi),%esi
f01018b8:	39 dd                	cmp    %ebx,%ebp
f01018ba:	77 f1                	ja     f01018ad <__umoddi3+0x2d>
f01018bc:	0f bd cd             	bsr    %ebp,%ecx
f01018bf:	83 f1 1f             	xor    $0x1f,%ecx
f01018c2:	89 4c 24 04          	mov    %ecx,0x4(%esp)
f01018c6:	0f 84 b4 00 00 00    	je     f0101980 <__umoddi3+0x100>
f01018cc:	b8 20 00 00 00       	mov    $0x20,%eax
f01018d1:	89 c2                	mov    %eax,%edx
f01018d3:	8b 44 24 04          	mov    0x4(%esp),%eax
f01018d7:	29 c2                	sub    %eax,%edx
f01018d9:	89 c1                	mov    %eax,%ecx
f01018db:	89 f8                	mov    %edi,%eax
f01018dd:	d3 e5                	shl    %cl,%ebp
f01018df:	89 d1                	mov    %edx,%ecx
f01018e1:	89 54 24 0c          	mov    %edx,0xc(%esp)
f01018e5:	d3 e8                	shr    %cl,%eax
f01018e7:	09 c5                	or     %eax,%ebp
f01018e9:	8b 44 24 04          	mov    0x4(%esp),%eax
f01018ed:	89 c1                	mov    %eax,%ecx
f01018ef:	d3 e7                	shl    %cl,%edi
f01018f1:	89 d1                	mov    %edx,%ecx
f01018f3:	89 7c 24 08          	mov    %edi,0x8(%esp)
f01018f7:	89 df                	mov    %ebx,%edi
f01018f9:	d3 ef                	shr    %cl,%edi
f01018fb:	89 c1                	mov    %eax,%ecx
f01018fd:	89 f0                	mov    %esi,%eax
f01018ff:	d3 e3                	shl    %cl,%ebx
f0101901:	89 d1                	mov    %edx,%ecx
f0101903:	89 fa                	mov    %edi,%edx
f0101905:	d3 e8                	shr    %cl,%eax
f0101907:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
f010190c:	09 d8                	or     %ebx,%eax
f010190e:	f7 f5                	div    %ebp
f0101910:	d3 e6                	shl    %cl,%esi
f0101912:	89 d1                	mov    %edx,%ecx
f0101914:	f7 64 24 08          	mull   0x8(%esp)
f0101918:	39 d1                	cmp    %edx,%ecx
f010191a:	89 c3                	mov    %eax,%ebx
f010191c:	89 d7                	mov    %edx,%edi
f010191e:	72 06                	jb     f0101926 <__umoddi3+0xa6>
f0101920:	75 0e                	jne    f0101930 <__umoddi3+0xb0>
f0101922:	39 c6                	cmp    %eax,%esi
f0101924:	73 0a                	jae    f0101930 <__umoddi3+0xb0>
f0101926:	2b 44 24 08          	sub    0x8(%esp),%eax
f010192a:	19 ea                	sbb    %ebp,%edx
f010192c:	89 d7                	mov    %edx,%edi
f010192e:	89 c3                	mov    %eax,%ebx
f0101930:	89 ca                	mov    %ecx,%edx
f0101932:	0f b6 4c 24 0c       	movzbl 0xc(%esp),%ecx
f0101937:	29 de                	sub    %ebx,%esi
f0101939:	19 fa                	sbb    %edi,%edx
f010193b:	8b 5c 24 04          	mov    0x4(%esp),%ebx
f010193f:	89 d0                	mov    %edx,%eax
f0101941:	d3 e0                	shl    %cl,%eax
f0101943:	89 d9                	mov    %ebx,%ecx
f0101945:	d3 ee                	shr    %cl,%esi
f0101947:	d3 ea                	shr    %cl,%edx
f0101949:	09 f0                	or     %esi,%eax
f010194b:	83 c4 1c             	add    $0x1c,%esp
f010194e:	5b                   	pop    %ebx
f010194f:	5e                   	pop    %esi
f0101950:	5f                   	pop    %edi
f0101951:	5d                   	pop    %ebp
f0101952:	c3                   	ret    
f0101953:	90                   	nop
f0101954:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f0101958:	85 ff                	test   %edi,%edi
f010195a:	89 f9                	mov    %edi,%ecx
f010195c:	75 0b                	jne    f0101969 <__umoddi3+0xe9>
f010195e:	b8 01 00 00 00       	mov    $0x1,%eax
f0101963:	31 d2                	xor    %edx,%edx
f0101965:	f7 f7                	div    %edi
f0101967:	89 c1                	mov    %eax,%ecx
f0101969:	89 d8                	mov    %ebx,%eax
f010196b:	31 d2                	xor    %edx,%edx
f010196d:	f7 f1                	div    %ecx
f010196f:	89 f0                	mov    %esi,%eax
f0101971:	f7 f1                	div    %ecx
f0101973:	e9 31 ff ff ff       	jmp    f01018a9 <__umoddi3+0x29>
f0101978:	90                   	nop
f0101979:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
f0101980:	39 dd                	cmp    %ebx,%ebp
f0101982:	72 08                	jb     f010198c <__umoddi3+0x10c>
f0101984:	39 f7                	cmp    %esi,%edi
f0101986:	0f 87 21 ff ff ff    	ja     f01018ad <__umoddi3+0x2d>
f010198c:	89 da                	mov    %ebx,%edx
f010198e:	89 f0                	mov    %esi,%eax
f0101990:	29 f8                	sub    %edi,%eax
f0101992:	19 ea                	sbb    %ebp,%edx
f0101994:	e9 14 ff ff ff       	jmp    f01018ad <__umoddi3+0x2d>
