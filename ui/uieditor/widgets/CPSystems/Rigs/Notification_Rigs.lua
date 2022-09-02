-- 84c8f402c3f0578f299451a875020147
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CPSystems.Rigs.RigInfo" )

CoD.Notification_Rigs = InheritFrom( LUI.UIElement )
CoD.Notification_Rigs.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Notification_Rigs )
	self.id = "Notification_Rigs"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 90 )
	self.anyChildUsesUpdateState = true
	
	local RigInfo2 = CoD.RigInfo.new( menu, controller )
	RigInfo2:setLeftRight( false, true, 25, 275 )
	RigInfo2:setTopBottom( true, false, 25, 75 )
	RigInfo2:linkToElementModel( self, "rig3", false, function ( model )
		RigInfo2:setModel( model, controller )
	end )
	self:addElement( RigInfo2 )
	self.RigInfo2 = RigInfo2
	
	local RigInfo1 = CoD.RigInfo.new( menu, controller )
	RigInfo1:setLeftRight( false, true, 15, 275 )
	RigInfo1:setTopBottom( true, false, 25, 75 )
	RigInfo1:linkToElementModel( self, "rig1", false, function ( model )
		RigInfo1:setModel( model, controller )
	end )
	self:addElement( RigInfo1 )
	self.RigInfo1 = RigInfo1
	
	local RigInfo0 = CoD.RigInfo.new( menu, controller )
	RigInfo0:setLeftRight( false, true, 15, 275 )
	RigInfo0:setTopBottom( true, false, 0, 50 )
	RigInfo0:linkToElementModel( self, "rig2", false, function ( model )
		RigInfo0:setModel( model, controller )
	end )
	self:addElement( RigInfo0 )
	self.RigInfo0 = RigInfo0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				RigInfo2:completeAnimation()
				self.RigInfo2:setLeftRight( false, true, 25, 275 )
				self.RigInfo2:setTopBottom( true, false, 25, 75 )
				self.clipFinished( RigInfo2, {} )

				RigInfo1:completeAnimation()
				self.RigInfo1:setLeftRight( false, true, 15, 275 )
				self.RigInfo1:setTopBottom( true, false, 25, 75 )
				self.clipFinished( RigInfo1, {} )

				RigInfo0:completeAnimation()
				self.RigInfo0:setLeftRight( false, true, 15, 275 )
				self.RigInfo0:setTopBottom( true, false, 0, 50 )
				self.clipFinished( RigInfo0, {} )
			end
		},
		RigCount_3 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				RigInfo2:completeAnimation()
				self.RigInfo2:setLeftRight( false, true, -500, 0 )
				self.RigInfo2:setTopBottom( true, false, 58, 90 )
				self.clipFinished( RigInfo2, {} )

				RigInfo1:completeAnimation()
				self.RigInfo1:setLeftRight( false, true, -500, 0 )
				self.RigInfo1:setTopBottom( true, false, 0, 32 )
				self.clipFinished( RigInfo1, {} )

				RigInfo0:completeAnimation()
				self.RigInfo0:setLeftRight( false, true, -500, 0 )
				self.RigInfo0:setTopBottom( true, false, 29, 61 )
				self.clipFinished( RigInfo0, {} )
			end
		},
		RigCount_2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				RigInfo2:completeAnimation()
				self.RigInfo2:setLeftRight( false, true, 90, 276 )
				self.RigInfo2:setTopBottom( true, false, 30, 62 )
				self.clipFinished( RigInfo2, {} )

				RigInfo1:completeAnimation()
				self.RigInfo1:setLeftRight( false, true, -500, 0 )
				self.RigInfo1:setTopBottom( true, false, 14, 46 )
				self.clipFinished( RigInfo1, {} )

				RigInfo0:completeAnimation()
				self.RigInfo0:setLeftRight( false, true, -500, 0 )
				self.RigInfo0:setTopBottom( true, false, 43, 75 )
				self.clipFinished( RigInfo0, {} )
			end
		},
		RigCount_1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				RigInfo2:completeAnimation()
				self.RigInfo2:setLeftRight( false, true, 63, 276 )
				self.RigInfo2:setTopBottom( true, false, 20, 70 )
				self.clipFinished( RigInfo2, {} )

				RigInfo1:completeAnimation()
				self.RigInfo1:setLeftRight( false, true, 46, 276 )
				self.RigInfo1:setTopBottom( true, false, 11, 60 )
				self.clipFinished( RigInfo1, {} )

				RigInfo0:completeAnimation()
				self.RigInfo0:setLeftRight( false, true, -500, 0 )
				self.RigInfo0:setTopBottom( true, false, 30, 80 )
				self.clipFinished( RigInfo0, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.RigInfo2:close()
		element.RigInfo1:close()
		element.RigInfo0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

