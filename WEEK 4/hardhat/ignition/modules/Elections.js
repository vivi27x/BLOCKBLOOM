// This setup uses Hardhat Ignition to manage smart contract deployments.
// Learn more about it at https://hardhat.org/ignition

const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");


module.exports = buildModule("ElectionsModule", (m) => {
  const Elections = m.contract("Gymkhana_elections",["0x11AE6Bd39C774946535D5e0d78754B03027922f7"]);
  return { Elections };
});
