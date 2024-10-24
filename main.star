import yaml

# main.star
geth = import_module("github.com/kurtosis-tech/geth-package/lib/geth.star")
lighthouse = import_module("github.com/kurtosis-tech/lighthouse-package/lib/lighthouse.star")
with open("./network_params.yaml") as stream:
    network_params = yaml.safe_load(stream)

def run(plan):
    final_genesis_timestamp = geth.generate_genesis_timestamp()
    el_genesis_data = geth.generate_el_genesis_data(plan, final_genesis_timestamp, network_params)
    el_context = geth.run(plan, network_params, el_genesis_data)
    lighthouse.run(plan, network_params, el_genesis_data, final_genesis_timestamp, el_context)

    return
