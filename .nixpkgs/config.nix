{
  allowUnfree = true;
  packageOverrides = pkgs : with pkgs; {
    rvmEnv = pkgs.myEnvFun {
      name = "ruby-build";
      buildInputs = [ stdenv which readline zlib openssl libxml2 libxslt libiconv mysql ];
      extraCmds = ''
        unset http_proxy
        unset ftp_proxy
        export LIBXML2_DIR=${libxml2}
        export LIBXSLT_DIR=${libxslt}
        export LIBICONV_DIR=${libiconv}
        export OPENSSL_DIR=${openssl}
        export READLINE_DIR=${readline}
        bash --login
        rvm use ruby
      '';
    };
  };
}
