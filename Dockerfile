FROM alpine:3.11
LABEL MAINTAINERS="Ben Engel <benjamin.engel@ymail.com>"

# Installing package required for the runtime 
RUN apk add --no-cache \
    bash \
    git \
    ruby \
    ruby-rake \
    tzdata 

# Installing Ruby Gems needed in the image
RUN gem install --no-document \
    bundler \
    rake \
    danger-gitlab 


ENV WORK_DIR "/danger"
ENV DANGER_GITLAB_HOST "your_awesome_gitlab_host"
ENV DANGER_GITLAB_API_BASE_URL "your_awesome_gitlab_api_base_url"

VOLUME ${WORK_DIR}
WORKDIR ${WORK_DIR}


CMD ["/bin/bash"]