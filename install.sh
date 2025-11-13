TYPST_PACKAGE_DIR=~/.local/share/typst/packages/local/
PACKAGE_INSTALL_DIR=$TYPST_PACKAGE_DIR/math-homework-template/0.1.0/

rm -rf $PACKAGE_INSTALL_DIR
mkdir -p $PACKAGE_INSTALL_DIR
cp -r . $PACKAGE_INSTALL_DIR
