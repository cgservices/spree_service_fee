# Add MENUITEMS admin tab
Deface::Override.new(
  virtual_path: 'spree/layouts/admin',
  name: 'service_fees_admin_tabs',
  insert_bottom: "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
  text: "<ul class=\"nav nav-sidebar\"><%= tab(:service_fees, :url => spree.admin_service_fees_path, :icon => 'money') %></ul>",
  disabled: false
)

# Add DASHBOARD admin tab
Deface::Override.new(
  virtual_path: 'spree/layouts/admin',
  name: 'dashboard_admin_tabs',
  insert_top: "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
  text: "<ul class=\"nav nav-sidebar\"><%= tab(:overview, :route => :admin_dashboard, match_path: '/dashboard' , :icon => 'dashboard') %></ul>",
  disabled: true
)
