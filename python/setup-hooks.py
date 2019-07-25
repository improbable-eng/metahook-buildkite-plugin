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

hooks += ['%s.bat' % hook for hook in hooks]

def cleanup_metahooks():
    """Remove the temporary hooks"""
    hooks = [os.path.join(HOOKDIR, hook) for hook in os.listdir(HOOKDIR) if hook != 'environment']
    for hook in hooks:
        os.remove(hook)

def create_metahooks():
    for hook in hooks:
        content = os.environ.get("BUILDKITE_PLUGIN_METAHOOK_%s" % hook.replace('-', '_').upper())
        if not content:
            continue
        with open(os.path.join(HOOKDIR, hook), 'w') as outfile:
            outfile.write(content)


def main():
    cleanup_metahooks()
    create_metahooks()

if __name__ == "__main__":
    main()