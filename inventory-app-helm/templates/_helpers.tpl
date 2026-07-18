{{/*
Expand the chart name.
*/}}
{{- define "inventory-app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Create a fully qualified application name.
*/}}
{{- define "inventory-app.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s" (include "inventory-app.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Chart name and version.
*/}}
{{- define "inventory-app.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" }}
{{- end }}

{{/*
Common Labels
*/}}
{{- define "inventory-app.labels" -}}
helm.sh/chart: {{ include "inventory-app.chart" . }}
app.kubernetes.io/name: {{ include "inventory-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: enterprise-inventory-platform
{{- end }}

{{/*
Selector Labels
*/}}
{{- define "inventory-app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "inventory-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Frontend Image
*/}}
{{- define "inventory-app.frontendImage" -}}
{{ .Values.global.imageRegistry }}/inventory-frontend:{{ .Values.frontend.image.tag }}
{{- end }}

{{/*
Backend Image
*/}}
{{- define "inventory-app.backendImage" -}}
{{ .Values.global.imageRegistry }}/inventory-backend:{{ .Values.backend.image.tag }}
{{- end }}