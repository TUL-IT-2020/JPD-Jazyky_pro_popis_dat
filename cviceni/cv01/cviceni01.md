#cvičení
# 1. cvičení
Regulární výrazy
- sed
- regex

; - středník odděluje regulérní výrazy
.* - všechno

## Prezentace: 
[[cviceni01.pdf]]

## Zadání: 
Regulární výrazy umožňují snadné **testování shody řetězců** a uplatňují se jak při **validaci** dat, tak při jejich **transformacích**. Prostudujte prezentaci připojenou k tomuto úkolu a vložte jako text řešení **příkazy** pro následující dílčí úlohy:

1. najděte v passwd.txt uživatele ze skupiny 550
2. vypište z passwd.txt jen uživatelská jména
3. vypište z passwd.txt uživatelská a plná jména (např. slizky - Lumir Slizky)
4. vypište z passwd.txt uživatelská a plná jména ve formátu Lumir Slizky (slizky)
5. data z passwd.txt převeďte do XML [dle vzoru v PDF](https://elearning.tul.cz/mod/resource/view.php?id=525664)

Použijte programy **grep** a **sed**. Jiné programy (awk, ...) poskytnou stejný výsledek, ale pro další látku je důležité zvládnutí **regulárních výrazů**. 

Instrukce k použití programů:

- [Unixové nástroje – 10 (echo, grep)](https://www.abclinuxu.cz/clanky/navody/unixove-nastroje-10-echo-grep)
- [Unixové nástroje – 9 (sed – nahrazování textu)](https://www.abclinuxu.cz/clanky/navody/unixove-nastroje-9-sed-nahrazovani-textu)

## Řešení

```Bash
# 1. vypiš te z passwd.txt jen uživatelská jména
grep ':[0-9]*:550:' passwd.txt 
# 2. vypište z passwd.txt jen uživatelská jména
sed 's/:.*//' passwd.txt 
# 3. vypiš te z passwd.txt uživatelská a plná jména, např.: slizky – Lumir Slizky
sed 's/:x[:0-9]*/ - /;s/:.*//' passwd.txt 
# 4. vypište z passwd.txt uživatelská a plná jména ve formátu Lumir Slizky (slizky)
sed 's/\([a-z]*\):x[:0-9]*:\([A-Za-z ]*\).*/\2 (\1)/' passwd.txt 
# 5. data z passwd.txt převeďte do XML
sed 's/\([a-z]*\):x:\([0-9]*\):\([0-9]*\):\([A-Za-z ]*\):.[a-z]*.[a-z]*:\(.*\)/<osoba id="\2">\n\t <skupina>\3<\/skupina>\n\t <nickname>\1<\/nickname>\n\t <name>\4<\/name>\n\t <shell>\5<\/shell>\n<\/osoba>\n/' passwd.txt
```

