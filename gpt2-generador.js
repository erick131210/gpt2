execShellCommand = function (cmd) {
  const { exec } = require('child_process');
  console.log("ShellCommand");
  console.log(cmd);
  const promise = new Promise(function (resolve, reject) {
    /*
    let opt = {};
    opt.cwd = './gpt2-2-Pytorch';
    */
    exec(cmd, function(error, stdout, stderr) {
      if (error) {
        //console.log(`error: ${error.message}`);
        //return reject();
      }
      if (stderr) {
        //console.log(`stderr: ${stderr}`);
        //return;
      }
      //console.log(`stdout: ${stdout}`);
      resolve(stdout);
    });
  });
  return promise;
}

//console.log("TEXTOOOOOOO", texto);



