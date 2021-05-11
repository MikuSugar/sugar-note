# `dd` 测试Linux硬盘性能
使用`dd` 命令简单测试硬盘
```shell
dd if=/dev/zero of=/data/disk1/tmp/test1.img bs=1G count=1 oflag=dsync
```
参数解释 
- `if=/dev/zero` (if=/dev/input.file) ：用来设置dd命令读取的输入文件名。
- `of=/data/disk1/tmp/test1.img` (of=/path/to/output.file)：dd命令将input.file写入的输出文件的名字。
- `bs=1G` (bs=block-size) ：设置dd命令读取的块的大小。例子中为1个G;bs选项的默认单位是bytes
- `count=1` (count=number-of-blocks)：dd命令读取的块的个数。
- `oflag=dsync` (oflag=dsync) ：使用同步I/O。不要省略这个选项。这个选项能够帮助你去除caching的影响，以便呈现给你精准的结果。
- `conv=fdatasyn`: 这个选项和`oflag=dsync`含义一样。

