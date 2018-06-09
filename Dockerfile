FROM alpine:3.7

RUN apk --no-cache --update-cache \
    add python3 \
	openblas \
        musl \
	linux-headers \
	gcc \
	g++ \
	make \
	gfortran \
	openblas-dev \
	python3-dev

RUN ln -s /usr/bin/python3 /usr/bin/python && \
    ln -s /usr/bin/pip3 /usr/bin/pip

ADD requirements.txt .

RUN pip install --no-cache-dir --upgrade pip 
RUN pip install --no-cache-dir numpy==1.14.3
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir scikit-learn==0.19.1

# pandas Issue #5299
RUN pip install --no-cache-dir pandas==0.23.0 --no-build-isolation
