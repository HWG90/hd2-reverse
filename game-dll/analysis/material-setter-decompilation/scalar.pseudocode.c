/* Ghidra pseudocode; not source. Generic raw GCC ABI misidentifies Windows arguments. */

void entry(undefined8 param_1,undefined8 param_2,undefined4 param_3,undefined8 param_4,
          undefined8 param_5,undefined4 param_6,long param_7)

{
  undefined8 *puVar1;
  undefined4 uVar2;
  ushort uVar3;
  undefined8 *puVar4;
  undefined4 *puVar5;
  undefined8 *puVar6;
  undefined4 in_XMM6_Da;
  undefined8 uStack0000000000000008;
  undefined1 local_28 [16];
  undefined4 local_18;
  undefined8 uStack_8;
  
  if ((*(long **)(param_7 + 8) != (long *)0x0) && (*(int *)(param_7 + 4) != 0xffffff)) {
    puVar6 = *(undefined8 **)(**(long **)(param_7 + 8) + 0x98);
    uStack0000000000000008 = param_4;
    local_18 = in_XMM6_Da;
    uStack_8 = param_5;
    puVar4 = (undefined8 *)
             (**(code **)(*(long *)*puVar6 + 0x30))(puVar6,param_7,local_28,(long *)*puVar6,0x20);
    puVar4 = (undefined8 *)*puVar4;
    *(undefined2 *)((long)puVar4 + 0xc) = 3;
    *(undefined4 *)(puVar4 + 1) = 0x20;
    *puVar4 = 0;
    uVar3 = ((short)((long)puVar4 + 0x13U >> 2) + 4) * 4 - ((short)puVar4 + 0x10);
    *(ushort *)((long)puVar4 + 0xe) = uVar3;
    puVar5 = (undefined4 *)((ulong)uVar3 + (long)puVar4);
    LOCK();
    puVar1 = (undefined8 *)puVar6[1];
    puVar6[1] = puVar4;
    UNLOCK();
    *puVar1 = puVar4;
    *puVar5 = 7;
    uVar2 = *(undefined4 *)(param_7 + 4);
    puVar5[3] = param_3;
    puVar5[1] = uVar2;
    puVar5[2] = param_6;
  }
  return;
}

