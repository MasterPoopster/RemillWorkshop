define i32 @ps3_random_number() {
    ret i32 42
}

define i32 @add_42(i32 %n) {
    %res = add i32 %n, 42
    ret i32 %res
}

define i32 @bytes_to_bits(i32 %n) {
    %res = mul i32 %n, 8
    ret i32 %res
}

define i32 @upper_32_bits(i64 %n) {
    %tmp = lshr i64 %n, 32
    %res = trunc i64 %tmp to i32
    ret i32 %res
}

define i32 @vm_operation(i1 %do_add, i32 %x, i32 %y) {
    %cond = icmp ugt i1 %do_add, 0
    br i1 %cond, label %bb_add, label %bb_sub
bb_add:
    %res_add = add i32 %x, %y
    br label %bb_end
bb_sub:
    %res_sub = sub i32 %x, %y
    br label %bb_end
bb_end:
    %res = phi i32 [%res_add, %bb_add], [%res_sub, %bb_sub]
    ret i32 %res
}

declare i32 @store_value(i32, i32)

define void @pass_to_store_value(i32 %n) {
    unreachable
}
