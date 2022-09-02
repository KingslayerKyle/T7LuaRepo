-- d8f37c683a778538617ad5a396e4330b
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 96 )
	self:setTopBottom( true, false, 0, 670 )
	self.anyChildUsesUpdateState = true
	
	local LockIcon = CoD.cac_LockBig.new( menu, controller )
	LockIcon:setLeftRight( true, false, 0, 96 )
	LockIcon:setTopBottom( true, false, 0, 670 )
	LockIcon:setAlpha( 0 )
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
				return true
			end
		}
	} )
	self:addElement( LockIcon )
	self.LockIcon = LockIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 0 )
				self.clipFinished( LockIcon, {} )
			end,
			ShowVariants = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 1 )
				self.clipFinished( LockIcon, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LockIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

