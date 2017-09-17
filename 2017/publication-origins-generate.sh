# Alex 2017-09-09
# Generate PDF for The Origins of Language.
# First convert to latex:

pandoc --latex-engine=xelatex -s publication-origins-language.md -o publication-origins-language.latex --variable=documentclass:article

# Then Follow advice in
# https://tex.stackexchange.com/questions/357616/how-to-insert-the-letters-%C6%9F-%C6%A2-%C6%8F-%CA%90-%D2%9A-and-%D2%A2,
# but with Charis SIL font.
# Place the following two lines after the first `\fi`:
#   \usepackage{fontspec}
#   \setmainfont{Charis SIL}
# And run again:

xelatex publication-origins-language.latex

