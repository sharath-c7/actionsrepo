{{- define "user-profile" -}}
name: {{ .Values.user.firstName }} {{ .Values.user.lastName }}
email: {{ .Values.user.email }}
location: {{ .Values.user.location.city }}, {{ .Values.user.location.country }}
profession: {{ .Values.user.profession }}
skills: {{ join ", " .Values.user.skills }}
{{- end -}} 