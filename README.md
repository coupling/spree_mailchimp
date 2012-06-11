MailChimp extension for Spree
==============

Based on the work of Sam Beam and Bastian Schnurle.

Example
=======

Include this code in your view:

    <% form_for :user, :url => :subscriptions do |f| %>
      <%= text_field_tag :email, t('enter_your_email'), :class => 'email' %>
      <%= submit_tag t('subscribe') %>
    <% end %>

Copyright (c) 2012 Martijn Lafeber, released under the New BSD License
