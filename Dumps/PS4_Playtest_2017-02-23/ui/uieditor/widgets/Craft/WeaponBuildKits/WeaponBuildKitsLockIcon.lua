require( "ui.uieditor.widgets.CAC.cac_LockBig" )

CoD.WeaponBuildKitsLockIcon = InheritFrom( LUI.UIElement )
CoD.WeaponBuildKitsLockIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WeaponBuildKitsLockIcon )
	self.id = "WeaponBuildKitsLockIcon"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 144 )
	self:setTopBottom( 0, 0, 0, 1005 )
	self.anyChildUsesUpdateState = true
	
	local LockIcon = CoD.cac_LockBig.new( menu, controller )
	LockIcon:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return not IsInPermanentUnlockMenu( controller )
			end
		}
	} )
	LockIcon:setLeftRight( 0, 0, 0, 144 )
	LockIcon:setTopBottom( 0, 0, -0.5, 1004.5 )
	LockIcon:setAlpha( 0 )
	self:addElement( LockIcon )
	self.LockIcon = LockIcon
	
	self.resetProperties = function ()
		LockIcon:completeAnimation()
		LockIcon:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			ShowVariants = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Locked = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 1 )
				self.clipFinished( LockIcon, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LockIcon:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

