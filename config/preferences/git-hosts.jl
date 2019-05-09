import RemoveLFS

const GIT_HOST = lowercase(strip(get(ENV, "GIT_HOST", "",)))

if GIT_HOST == "github"
    const GITHUB_DST_ORGANIZATION = "UnofficialJuliaMirrorSnapshots"
    const GITHUB_BOT_USERNAME = "UnofficialJuliaMirrorBot"
    const GITHUB_BOT_PERSONAL_ACCESS_TOKEN =
        ENV["GITHUB_BOT_PERSONAL_ACCESS_TOKEN"]
    const dst_provider =
        RemoveLFS.Hosts.GitHubDstHost.new_github_session(
            ;
            github_organization = GITHUB_DST_ORGANIZATION,
            github_bot_username = GITHUB_BOT_USERNAME,
            github_bot_personal_access_token =
                GITHUB_BOT_PERSONAL_ACCESS_TOKEN,
            )
elseif GIT_HOST == "gitlab"
    const GITLAB_DST_GROUP = "UnofficialJuliaMirrorSnapshots"
    const GITLAB_BOT_USERNAME = "UnofficialJuliaMirrorBot"
    const GITLAB_BOT_PERSONAL_ACCESS_TOKEN =
        ENV["GITLAB_BOT_PERSONAL_ACCESS_TOKEN"]
    const dst_provider =
        RemoveLFS.Hosts.GitLabDstHost.new_gitlab_session(
            ;
            gitlab_group = GITLAB_DST_GROUP,
            gitlab_bot_username = GITLAB_BOT_USERNAME,
            gitlab_bot_personal_access_token =
                GITLAB_BOT_PERSONAL_ACCESS_TOKEN,
            )
elseif GIT_HOST == "bitbucket"
    const BITBUCKET_DST_TEAM = "UnofficialJuliaMirrorSnapshots"
    const BITBUCKET_BOT_USERNAME = "UnofficialJuliaMirrorBot"
    const BITBUCKET_BOT_APP_PASSWORD =
        ENV["BITBUCKET_BOT_APP_PASSWORD"]
    const dst_provider =
        RemoveLFS.Hosts.BitbucketDstHost.new_bitbucket_session(
            ;
            bitbucket_team = BITBUCKET_DST_TEAM,
            bitbucket_bot_username = BITBUCKET_BOT_USERNAME,
            bitbucket_bot_app_password = BITBUCKET_BOT_APP_PASSWORD,
            )
else
    error(
        string(
            "You must set the \"GIT_HOST\" environment variable, ",
            "and it must be set to one of the following values: ",
            "GITHUB GITLAB BITBUCKET",
            )
        )
end
