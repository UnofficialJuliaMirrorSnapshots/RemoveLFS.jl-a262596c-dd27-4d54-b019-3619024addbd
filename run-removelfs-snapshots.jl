##### Beginning of file

@info("Importing the RemoveLFS module...")

import RemoveLFS

import TimeZones

@info("Reading config files...")

include(joinpath("config","preferences","branches.jl",))
include(joinpath("config","preferences","git-hosts.jl",))
include(joinpath("config","preferences","git-user.jl",))
include(joinpath("config","preferences","time-zone.jl",))

include(
    joinpath(
        "config", "repositories",
        "do-not-push-to-these-destinations.jl",
        )
    )
include(
    joinpath(
        "config", "repositories",
        "do-not-try-url-list.jl",
        )
    )
include(
    joinpath(
        "config", "repositories",
        "download-git-lfs-repos-list.jl",
        )
    )
include(
    joinpath(
        "config", "repositories",
        "try-but-allow-failures-url-list.jl",
        )
    )

RemoveLFS.CommandLine.run_removelfs_snapshots_command_line!!(
    ;
    arguments = ARGS,
    git_user_name = GIT_USER_NAME,
    git_user_email = GIT_USER_EMAIL,
    git_lfs_repos = GIT_LFS_REPOS,
    dst_provider = dst_provider,
    include_branches = INCLUDE_BRANCHES,
    exclude_branches = EXCLUDE_BRANCHES,
    do_not_try_url_list = DO_NOT_TRY_URL_LIST,
    do_not_push_to_these_destinations = DO_NOT_PUSH_TO_THESE_DESTINATIONS,
    try_but_allow_failures_url_list = TRY_BUT_ALLOW_FAILURES_URL_LIST,
    time_zone = TIME_ZONE,
    )

##### End of file
