import os

HOOKDIR = os.path.join(os.path.dirname(__file__), '..', 'hooks')

hooks = [
    # "environment" # not allowed
    "pre-checkout",
    "checkout",
    "post-checkout",
    "pre-command",
    "command",
    "post-command",
    "pre-artifact",
    "post-artifact",
    "pre-exit",
]

def cleanup_metahooks():
    """Remove the temporary hooks"""
    hooks = [os.path.join(HOOKDIR, hook) for hook in os.listdir(HOOKDIR)]
    for hook in hooks:
        if hook == 'environment.sh':
            continue # skip the geniuine plugin hook
        os.remove(hook)

def create_metahooks():
    with open(os.path.join(HOOKDIR, 'pre-checkout.sh'), 'w') as outfile:
        outfile.write("ls")


def main():
    create_metahooks()

if __name__ == "__main__":
    main()