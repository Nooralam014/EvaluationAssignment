var Task = artifacts.require('Token');
module.exports = (deployer) => {
deployer.deploy(Task, "SystemsTask","STSK",18);
}