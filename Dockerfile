FROM rocker/tidyverse:3.5.1
MAINTAINER Y.Matsuoka

# Change environment to Japanese(Character and DateTime)
ENV LANG ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8
RUN sed -i '$d' /etc/locale.gen \
    && echo "ja_JP.UTF-8 UTF-8" >> /etc/locale.gen \
        && locale-gen ja_JP.UTF-8 \
        && /usr/sbin/update-locale LANG=ja_JP.UTF-8 LANGUAGE="ja_JP:ja"
RUN /bin/bash -c "source /etc/default/locale"
RUN ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# Install packages
RUN install2.r -e caTools lpSolveAPI makedummies


# Install ipaexfont
RUN apt-get update && apt-get install -y \
  fonts-ipaexfont

CMD ["/init"]
WORKDIR /root/workspace
