local CollapseToCustomized = function ( self, event )
	self:setState( "Collapsed" )
end

local UpdateAttachments = function ( self, event )
	local localizedAttachments = ""
	local attachmentCount = 0
	if event.attachment1DisplayName ~= nil then
		localizedAttachments = Engine.Localize( event.attachment1DisplayName )
		attachmentCount = attachmentCount + 1
	end
	if event.attachment2DisplayName ~= nil then
		localizedAttachments = localizedAttachments .. " + " .. Engine.Localize( event.attachment2DisplayName )
		attachmentCount = attachmentCount + 1
	end
	if event.attachment3DisplayName ~= nil then
		localizedAttachments = localizedAttachments .. " + " .. Engine.Localize( event.attachment3DisplayName )
		attachmentCount = attachmentCount + 1
	end
	self:setState( "DefaultState" )
	self.Attachments:setText( localizedAttachments )
	if self.collapseTimer ~= nil then
		self.collapseTimer:close()
	end
	if attachmentCount > 1 then
		local collapseTimer = LUI.UITimer.new( 3000, "collapse_to_customized", true, self )
		self.collapseTimer = collapseTimer
		self:addElement( collapseTimer )
	end
end

local PostLoadFunc = function ( self )
	self.UpdateAttachments = UpdateAttachments
	self:registerEventHandler( "collapse_to_customized", CollapseToCustomized )
end

CoD.AttachmentInfoProto = InheritFrom( LUI.UIElement )
CoD.AttachmentInfoProto.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 5
	} )
	self:setAlignment( LUI.Alignment.Right )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AttachmentInfoProto )
	self.id = "AttachmentInfoProto"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 296 )
	self:setTopBottom( true, false, 0, 18 )
	
	local Attachments = LUI.UITightText.new()
	Attachments:setLeftRight( false, true, -108, 0 )
	Attachments:setTopBottom( false, true, -18, 0 )
	Attachments:setRGB( 1, 1, 1 )
	Attachments:setText( Engine.Localize( "Attachments here" ) )
	Attachments:setTTF( "fonts/UnitedSansSmCdLt_0.ttf" )
	self:addElement( Attachments )
	self.Attachments = Attachments
	
	local WeaponNameStrokeLbl = LUI.UITightText.new()
	WeaponNameStrokeLbl:setLeftRight( false, true, -281, -113 )
	WeaponNameStrokeLbl:setTopBottom( false, true, -19, 1 )
	WeaponNameStrokeLbl:setRGB( 1, 1, 1 )
	WeaponNameStrokeLbl:setTTF( "fonts/UnitedSansSmCdBd_0.ttf" )
	WeaponNameStrokeLbl:subscribeToGlobalModel( controller, "CurrentWeapon", "weaponName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WeaponNameStrokeLbl:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( WeaponNameStrokeLbl )
	self.WeaponNameStrokeLbl = WeaponNameStrokeLbl
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Attachments:completeAnimation()
				self.Attachments:setAlpha( 1 )
				self.clipFinished( Attachments, {} )
				WeaponNameStrokeLbl:completeAnimation()
				self.WeaponNameStrokeLbl:setAlpha( 1 )
				self.clipFinished( WeaponNameStrokeLbl, {} )
			end
		},
		Collapsed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Attachments:completeAnimation()
				self.Attachments:setAlpha( 0 )
				self.clipFinished( Attachments, {} )
				WeaponNameStrokeLbl:completeAnimation()
				self.WeaponNameStrokeLbl:setAlpha( 1 )
				self.clipFinished( WeaponNameStrokeLbl, {} )
			end
		}
	}
	self.close = function ( self )
		self.WeaponNameStrokeLbl:close()
		CoD.AttachmentInfoProto.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

