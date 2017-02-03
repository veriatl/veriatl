procedure driver();
  modifies $tarHeap, $linkHeap;
  requires valid_src_model($srcHeap);
  