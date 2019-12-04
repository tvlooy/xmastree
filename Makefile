.PHONY: all
.RECIPEPREFIX = |

all:
| docker build -t tvlooy/xmastree -f ./Dockerfile ./
| docker push tvlooy/xmastree

