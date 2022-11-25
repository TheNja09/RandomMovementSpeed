function _OnFrame()
	World = ReadByte(Now + 0x00)
	Room = ReadByte(Now + 0x01)
	Place = ReadShort(Now + 0x00)
	Door = ReadShort(Now + 0x02)
	Map = ReadShort(Now + 0x04)
	Btl = ReadShort(Now + 0x06)
	Evt = ReadShort(Now + 0x08)
	Cheats()
end

function _OnInit()
	if GAME_ID == 0xF266B00B or GAME_ID == 0xFAF99301 and ENGINE_TYPE == "ENGINE" then--PCSX2
		Platform = 'PS2'
		Now = 0x032BAE0 --Current Location
		Save = 0x032BB30 --Save File
		Obj0 = 0x1C94100 --00objentry.bin
		Sys3 = 0x1CCB300 --03system.bin
		Btl0 = 0x1CE5D80 --00battle.bin
		Slot1 = 0x1C6C775 --Unit Slot 1
	elseif GAME_ID == 0x431219CC and ENGINE_TYPE == 'BACKEND' then--PC
		Platform = 'PC'
		Now = 0x0714DB8 - 0x56454E
		Save = 0x09A7070 - 0x56475E
		Obj0 = 0x2A22B90 - 0x56475E
		Sys3 = 0x2A59DB0 - 0x56475E
		Btl0 = 0x2A74840 - 0x56475E
		Slot1 = 0x2A20C58 - 0x56475E
	end
end

function Events(M,B,E) --Check for Map, Btl, and Evt
	return ((Map == M or not M) and (Btl == B or not B) and (Evt == E or not E))
end

function Cheats()
WriteFloat(Sys3+0x17CE4, (math.random(4,75)))
WriteFloat(Sys3+0x17D18, (math.random(4,75))) -- Valor Form: DS = 12
WriteFloat(Sys3+0x17D4C, (math.random(4,75))) -- Wisdom Form: DS = 12
WriteFloat(Sys3+0x17D80, (math.random(4,75))) -- Master Form: DS = 10
WriteFloat(Sys3+0x17DB4, (math.random(4,75))) -- Final Form: DS = 16
WriteFloat(Sys3+0x17E1C, (math.random(4,75))) -- Lion Sora: DS = 18
WriteFloat(Sys3+0x17DE8, (math.random(4,75))) -- Anti Form: DS = 16
WriteFloat(Sys3+0x17E75, (math.random(4,75))) -- Mermaid Sora: DS = 7
WriteFloat(Sys3+0x18190, (math.random(4,75))) -- Carpet Sora: DS = 20
WriteFloat(Sys3+0x181F8, (math.random(4,75))) -- Dice Sora: DS = 8
WriteFloat(Sys3+0x1822C, (math.random(4,75))) -- Card Sora: DS = 8
WriteFloat(Sys3+0x18364, (math.random(4,75))) -- Limit Form: DS = 8
end
