-- 4b6c36d7e1714d69ce700f7235e45104
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Groups.GroupsBetaWidget" )

CoD.GroupsBetaSafeAreaContainer = InheritFrom( LUI.UIElement )
CoD.GroupsBetaSafeAreaContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GroupsBetaSafeAreaContainer )
	self.id = "GroupsBetaSafeAreaContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local GroupsBetaWidget = CoD.GroupsBetaWidget.new( menu, controller )
	GroupsBetaWidget:setLeftRight( false, true, -206, -6 )
	GroupsBetaWidget:setTopBottom( false, true, -34, -12 )
	self:addElement( GroupsBetaWidget )
	self.GroupsBetaWidget = GroupsBetaWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				GroupsBetaWidget:completeAnimation()
				self.GroupsBetaWidget:setAlpha( 0 )
				self.clipFinished( GroupsBetaWidget, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				GroupsBetaWidget:completeAnimation()
				self.GroupsBetaWidget:setAlpha( 1 )
				self.clipFinished( GroupsBetaWidget, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GroupsBetaWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

