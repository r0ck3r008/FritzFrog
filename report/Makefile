TEX := pdflatex
OBJECT := FinalReport

all: report

report:
	${TEX} --shell-escape ${OBJECT}.tex
	biber ${OBJECT}
	${TEX} --shell-escape ${OBJECT}.tex