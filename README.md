# proguard-dictionary-generate

受到 `https://github.com/PureWriter/proguard-dict`、`https://github.com/ionull/proguard-dictionary-generator` 启发，编写 shell 语言脚本方便使用。

## 使用

1. 下载工程 proguard-dictionary-generate.sh
2. 执行
    * run `./proguard-dictionary-generate.sh`

## 命令行参数说明

1. -n 文件名称 (default proguard-dictionary.txt)
2. -f 开始长度 (default 6)
3. -t 结束长度 (default 30)

例: `./proguard-dictionary-generate.sh --n halo -f 7 -t 70`
