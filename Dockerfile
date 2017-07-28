FROM node:8.2.1-alpine

#
# Install git
#

RUN apk update && apk add --no-cache git && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*


#
# Clone apps
#

RUN git clone --depth 1 https://github.com/jakub-gawlas/content-generator generator
RUN git clone --depth 1 https://github.com/jakub-gawlas/content-deliverer deliverer


#
# Install dependencies
#

RUN cd generator && yarn
RUN cd deliverer && yarn


#
# Set env vars
#

ENV APP_HOT_RELOAD true

# Generator
ENV APP_SRC_PATH /src/docu
ENV APP_DOCU_CONFIG_PATH /src/docu.config.json
ENV APP_OUT_PATH /out

# Deliverer
ENV APP_DATA_FILE_PATH /out/data.json
ENV APP_RESOURCES_DIR_PATH /out/resources

#
# Copy start script
#

COPY start.sh /


#
# Expose ports
#

# Deliverer
EXPOSE 3000 5000


# Start apps
CMD ["sh", "start.sh"]
