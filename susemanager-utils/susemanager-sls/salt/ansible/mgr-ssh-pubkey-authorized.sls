/tmp/mgr-ssh-pubkey-authorized.yml:
  file.managed:
    - source: 'salt://ansible/mgr-ssh-pubkey-authorized.yml'

ssh_pubkey_authorized_via_ansible:
  ansible.playbooks:
    - name: mgr-ssh-pubkey-authorized.yml
    - rundir: /tmp
    - ansible_kwargs:
        inventory: "{{ pillar['inventory'] }}"
        limit: "{{ pillar['target_host'] }}"
        extra_vars:
            user: "{{ pillar['user'] }}"
            ssh_pubkey: "{{ pillar['ssh_pubkey'] }}"

mgr_ssh_pubkey_authorize_playbook_cleanup:
  file.absent:
    - name: /tmp/mgr-ssh-pubkey-authorized.yml