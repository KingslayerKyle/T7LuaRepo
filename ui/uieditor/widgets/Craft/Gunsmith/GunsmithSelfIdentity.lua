-- 71c744c5dacb0ed4184df532342fb5cd
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 348 )
	self:setTopBottom( true, false, 0, 67 )
	self.anyChildUsesUpdateState = true
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( menu, controller )
	SelfIdentityBadge:setLeftRight( false, true, -348, -5 )
	SelfIdentityBadge:setTopBottom( true, false, 4, 64 )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				SelfIdentityBadge:completeAnimation()
				self.SelfIdentityBadge:setAlpha( 1 )
				self.clipFinished( SelfIdentityBadge, {} )
			end
		},
		Hide = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				SelfIdentityBadge:completeAnimation()
				self.SelfIdentityBadge:setAlpha( 0 )
				self.clipFinished( SelfIdentityBadge, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.SelfIdentityBadge:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

