# Alex 2017-09-09
# Generate PDF for The Origins of Language.
# Follow advice in
# https://tex.stackexchange.com/questions/64802/the-character-%C9%99-in-plain-tex:
# Insert the following lines before the first schwa:
# \font\tenipa=tipa10
# \def\schwa{{\tenipa\char64}}
# Then replace all Ə by \schwa
# Finally run the following command inside the 2017/ directory:

pandoc --latex-engine=xelatex -s origins-language.md -o origins-language.pdf --variable=documentclass:article

