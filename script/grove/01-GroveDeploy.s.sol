// SPDX-FileCopyrightText: © 2023 Dai Foundation <www.daifoundation.org>
// SPDX-License-Identifier: AGPL-3.0-or-later
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.
pragma solidity ^0.8.16;

import {Script} from "forge-std/Script.sol";
import {ScriptTools} from "dss-test/ScriptTools.sol";
import {Reader} from "../helpers/Reader.sol";
import {SDAODeploy, SDAODeployParams} from "../dependencies/SDAODeploy.sol";

contract GroveDeployScript is Script {
    string internal constant NAME = "grove/grove-deploy";

    function run() external {
        Reader reader = new Reader(ScriptTools.loadConfig());

        address admin = reader.envOrReadAddress("FOUNDRY_ADMIN", ".admin");

        vm.startBroadcast();

        address grove = SDAODeploy.deploy(
            SDAODeployParams({deployer: msg.sender, owner: admin, name: "Grove", symbol: "GROVE"})
        );

        vm.stopBroadcast();

        ScriptTools.exportContract(NAME, "admin", admin);
        ScriptTools.exportContract(NAME, "grove", grove);
        ScriptTools.exportValue(NAME, "name", "Grove");
        ScriptTools.exportValue(NAME, "symbol", "GROVE");
    }
}
