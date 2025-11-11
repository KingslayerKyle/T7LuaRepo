require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )

CoD.GunsmithSelfIdentity = InheritFrom( LUI.UIElement )
CoD.GunsmithSelfIdentity.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GunsmithSelfIdentity )
	self.id = "GunsmithSelfIdentity"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 522 )
	self:setTopBottom( 0, 0, 0, 100 )
	self.anyChildUsesUpdateState = true
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( menu, controller )
	SelfIdentityBadge:setLeftRight( 1, 1, -522, -8 )
	SelfIdentityBadge:setTopBottom( 0, 0, 6, 96 )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	self.resetProperties = function ()
		SelfIdentityBadge:completeAnimation()
		SelfIdentityBadge:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Hide = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				SelfIdentityBadge:completeAnimation()
				self.SelfIdentityBadge:setAlpha( 0 )
				self.clipFinished( SelfIdentityBadge, {} )
			end
		}
	}
	SelfIdentityBadge.id = "SelfIdentityBadge"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.SelfIdentityBadge:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

