Script inputs for Mainnet for `grove`.

In order to run the script follow these steps:
1. Copy the `template-grove-deploy.json` file, name it meaningfully (i.e. `production-grove-deploy.json`) and replace placeholder config values with actual values.
2. Make sure that `script/output/1/grove` directory exists.
3. Make sure that the following env variables are set (either set them manually or use `.env` file):
    - `FOUNDRY_ROOT_CHAINID=1`
    - `FOUNDRY_SCRIPT_CONFIG=<config_file_path>` (relative path, without `.json` suffix - i.e. `grove/production-grove-deploy`)
    - `MAINNET_RPC_URL=<Ethereum_Mainnet_RPC_URL>`
4. Make sure to prepare a proper wallet, topped with ETH to execute transactions. Consult __Foundry__ documentation to confirm how to correctly execute a script using a particular wallet.
5. Prepare a proper mainnet node RPC url.
6. To simulate the correctness of the deployment sequence run the following command:
```sh
forge script --rpc-url $YOUR_MAINNET_RPC_URL script/grove/01-GroveDeploy.s.sol:GroveDeployScript
# add any other options that might be needed, especially the ones needed for a proper key unlock
```
7. To execute the on-chain deployment, run the following command:
```sh
forge script --rpc-url $YOUR_MAINNET_RPC_URL --broadcast --verify script/grove/01-GroveDeploy.s.sol:GroveDeployScript
# add any other options that might be needed, especially the ones needed for a proper key unlock
```
