provider "docker" {
  host = "tcp://127.0.0.1:2375/"
}

resource "docker_image" "influxdb" {
  name = "cybersavvy/influxdb:latest"
}

resource "docker_image" "prometheus" {
  name = "cybersavvy/prometheus:latest"
}

resource "docker_image" "blackbox-exporter" {
  name = "cybersavvy/blackbox-exporter:latest"
}

resource "docker_image" "grafana" {
  name = "cybersavvy/grafana:latest"
}

resource "docker_container" "influxdb-server" {
  name = "influxdb-server"
  image = "${docker_image.influxdb.latest}"
  ports {
    internal = 8086
    external = 8086
  }
}

resource "docker_container" "prometheus-server" {
  name = "prometheus-server"
  image = "${docker_image.prometheus.latest}"
  ports {
    internal = 9090
    external = 9090
  }
}

resource "docker_container" "blackbox-exporter-prober" {
  name = "blackbox-exporter"
  image = "${docker_image.blackbox-exporter.latest}"
  ports {
    internal = 9115
    external = 9115
  }
}

resource "docker_container" "grafana-server" {
  name = "grafana-server"
  image = "${docker_image.grafana.latest}"
  ports {
    internal = 3000
    external = 3000
  }
}
