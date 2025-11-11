require( "ui.uieditor.widgets.FileShare.FileshareSelectedItemAuthor" )
require( "ui.uieditor.widgets.FileShare.FileshareSelectedItemPublishedTime" )
require( "ui.uieditor.widgets.FileShare.FileshareStat" )

CoD.FileshareSelectedItemInfo = InheritFrom( LUI.UIElement )
CoD.FileshareSelectedItemInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FileshareSelectedItemInfo )
	self.id = "FileshareSelectedItemInfo"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 627 )
	self:setTopBottom( 0, 0, 0, 126 )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( 0, 0, 0, 627 )
	BG:setTopBottom( 0, 0, 0, 70 )
	BG:setRGB( 0, 0, 0 )
	BG:setAlpha( 0.5 )
	self:addElement( BG )
	self.BG = BG
	
	local FileshareSelectedItemAuthor0 = CoD.FileshareSelectedItemAuthor.new( menu, controller )
	FileshareSelectedItemAuthor0:setLeftRight( 0, 0, 6, 400 )
	FileshareSelectedItemAuthor0:setTopBottom( 0, 0, 4, 40 )
	FileshareSelectedItemAuthor0:linkToElementModel( self, "fileAuthorName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FileshareSelectedItemAuthor0.AuthorName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( FileshareSelectedItemAuthor0 )
	self.FileshareSelectedItemAuthor0 = FileshareSelectedItemAuthor0
	
	local FileshareSelectedItemPublishedTime0 = CoD.FileshareSelectedItemPublishedTime.new( menu, controller )
	FileshareSelectedItemPublishedTime0:setLeftRight( 0, 0, 6, 526 )
	FileshareSelectedItemPublishedTime0:setTopBottom( 0, 0, 40.5, 67.5 )
	FileshareSelectedItemPublishedTime0:linkToElementModel( self, "fileCreateTime", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FileshareSelectedItemPublishedTime0.PublishTime:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( FileshareSelectedItemPublishedTime0 )
	self.FileshareSelectedItemPublishedTime0 = FileshareSelectedItemPublishedTime0
	
	local StatLikes = CoD.FileshareStat.new( menu, controller )
	StatLikes:setLeftRight( 0, 0, 0, 150 )
	StatLikes:setTopBottom( 0, 0, 79.5, 106.5 )
	StatLikes.Icon:setImage( RegisterImage( "t7_icon_menu_options_like" ) )
	StatLikes:subscribeToGlobalModel( controller, "FileshareRoot", nil, function ( model )
		StatLikes:setModel( model, controller )
	end )
	StatLikes:linkToElementModel( self, "fileLikesCount", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StatLikes.TextBox0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( StatLikes )
	self.StatLikes = StatLikes
	
	local StatDislikes = CoD.FileshareStat.new( menu, controller )
	StatDislikes:setLeftRight( 0, 0, 159, 309 )
	StatDislikes:setTopBottom( 0, 0, 79.5, 106.5 )
	StatDislikes.Icon:setImage( RegisterImage( "t7_icon_menu_options_dislike" ) )
	self:addElement( StatDislikes )
	self.StatDislikes = StatDislikes
	
	local StatViews = CoD.FileshareStat.new( menu, controller )
	StatViews:setLeftRight( 0, 0, 318, 468 )
	StatViews:setTopBottom( 0, 0, 79.5, 106.5 )
	StatViews.Icon:setImage( RegisterImage( "t7_icon_menu_options_views" ) )
	self:addElement( StatViews )
	self.StatViews = StatViews
	
	local StatDownloads = CoD.FileshareStat.new( menu, controller )
	StatDownloads:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not FileshareCanShowDownloadsStats( controller )
			end
		}
	} )
	StatDownloads:setLeftRight( 0, 0, 477, 627 )
	StatDownloads:setTopBottom( 0, 0, 79.5, 106.5 )
	StatDownloads.Icon:setImage( RegisterImage( "t7_icon_menu_options_downloads" ) )
	self:addElement( StatDownloads )
	self.StatDownloads = StatDownloads
	
	self.StatDislikes:linkToElementModel( self, "fileDislikesCount", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StatDislikes.TextBox0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.StatViews:linkToElementModel( self, "fileViewsCount", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StatViews.TextBox0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.StatDownloads:linkToElementModel( self, "fileDownloadsCount", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StatDownloads.TextBox0:setText( Engine.Localize( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FileshareSelectedItemAuthor0:close()
		self.FileshareSelectedItemPublishedTime0:close()
		self.StatLikes:close()
		self.StatDislikes:close()
		self.StatViews:close()
		self.StatDownloads:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

